package dao;
import entities.*;
import java.text.SimpleDateFormat;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.*;
import javax.servlet.http.Part;



import tools.MySqlConnection;

public class CredentialsDAO implements ICredentialsDao{
	private ICredentialsDao dao;
	public Conversation getLastConversation(int userId) {
	   dao = new CredentialsDAO();

	    try (Connection connection = MySqlConnection.getconnectionmysql();
	         PreparedStatement statement = connection.prepareStatement("SELECT c.* FROM conversation AS c " +
	                 "INNER JOIN ( " +
	                 "  SELECT conversation_app, MAX(dateEnvoi) AS last_message_date " +
	                 "  FROM message " +
	                 "  WHERE proprietaire = ? " +
	                 "  GROUP BY conversation_app " +
	                 ") AS m ON c.id_conv = m.conversation_app " +
	                 "ORDER BY m.last_message_date DESC " +
	                 "LIMIT 1;")) {

	        statement.setInt(1, userId);

	        try (ResultSet resultSet = statement.executeQuery()) {
	            if (resultSet.next()) {
	                int idConv = resultSet.getInt("id_conv");
	                Conversation lastConversation = dao.getconvById(idConv);
	                // Set other conversation properties as needed
	                return lastConversation;
	            }
	        }
	    } catch (SQLException e) {
	        // Handle any exceptions here
	        e.printStackTrace();
	    }

	    return null; // Return null if no conversation is found
	}


	//all users 
	public List<Utilisateur> allUsers() {
	    ICredentialsDao dao = new CredentialsDAO();
	    List<Utilisateur> allUsers = new ArrayList<>();
	    String sql = "SELECT * FROM utilisateur";
	    
	    try (Connection connection = MySqlConnection.getconnectionmysql();
	         PreparedStatement statement = connection.prepareStatement(sql);
	         ResultSet rs = statement.executeQuery()) {
	        
	        while (rs.next()) {
	            int idUser = rs.getInt("id_util");
	            Utilisateur utilisateur = dao.getutilById(idUser);
	            allUsers.add(utilisateur);
	        }
	        
	    } catch (SQLException e) {
	        // Handle the SQLException appropriately, such as logging or throwing a custom exception
	        e.printStackTrace();
	    }
	    
	    return allUsers;
	}

	
	
	//last object message
	public Message getLastMessageObj(int conversationId) {
	    CredentialsDAO dao = new CredentialsDAO();
	    Message lastMessage = null; // Default value if no message is found

	    // SQL query
	    String sql = "SELECT * FROM message WHERE conversation_app = ? ORDER BY dateEnvoi DESC LIMIT 1";

	    try (Connection connection = MySqlConnection.getconnectionmysql();
	         PreparedStatement statement = connection.prepareStatement(sql)) {

	        // Set the conversation ID parameter in the prepared statement
	        statement.setInt(1, conversationId);

	        // Execute the query
	        try (ResultSet resultSet = statement.executeQuery()) {
	            // Check if a result exists
	            if (resultSet.next()) {
	                lastMessage = new Message();
	                lastMessage.setId_message(resultSet.getInt("id_message"));
	                lastMessage.setContenue(resultSet.getString("contenue"));

	                Timestamp timestamp = resultSet.getTimestamp("dateEnvoi");
	                SimpleDateFormat dateFormat = new SimpleDateFormat("dd HH:mm");
	                String formattedDate = dateFormat.format(timestamp);
	                lastMessage.setDateEnvoi(formattedDate);

	                int expediteurId = resultSet.getInt("expediteur");
	                int proprietaireId = resultSet.getInt("proprietaire");
	                lastMessage.setExpediteur(dao.getutilById(expediteurId));
	                lastMessage.setProprietaire(dao.getutilById(proprietaireId));
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return lastMessage;
	}

	public String getLastMessage(int conversationId) {
	    String lastMessage = null; // Default value if no message is found

	    // SQL query
	    String sql = "SELECT contenue FROM message WHERE conversation_app = ? ORDER BY dateEnvoi DESC LIMIT 1";

	    try (Connection connection = MySqlConnection.getconnectionmysql();
	         PreparedStatement statement = connection.prepareStatement(sql)) {

	        // Set the conversation ID parameter in the prepared statement
	        statement.setInt(1, conversationId);

	        // Execute the query
	        try (ResultSet resultSet = statement.executeQuery()) {
	            // Check if a result exists
	            if (resultSet.next()) {
	                lastMessage = resultSet.getString("contenue");
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return lastMessage;
	}

	public Conversation LastConversation(int messageBoxId) {
	    Conversation conversation = null;
	    ICredentialsDao dao = new CredentialsDAO();

	    try (Connection connection = MySqlConnection.getconnectionmysql();
	         PreparedStatement statement = connection.prepareStatement(
	                 "SELECT id_conv, date_creation, participantA, participantB " +
	                 "FROM conversation " +
	                 "WHERE id_message_box = ? " +
	                 "ORDER BY date_creation DESC " +
	                 "LIMIT 1"
	         )) {

	        // Set the message box ID parameter in the prepared statement
	        statement.setInt(1, messageBoxId);

	        try (ResultSet resultSet = statement.executeQuery()) {
	            // Check if a result exists
	            if (resultSet.next()) {
	                conversation = new Conversation();
	                conversation.setId_conv(resultSet.getInt("id_conv"));
	                conversation.setDateConv(resultSet.getDate("date_creation"));
	                conversation.setParticipantA(dao.getutilById(resultSet.getInt("participantA")));
	                conversation.setParticipantB(dao.getutilById(resultSet.getInt("participantB")));
	                conversation.setMessages(dao.ListeMessagesByconvId(resultSet.getInt("id_conv")));
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return conversation;
	}

		
	//reteive the conversation depending on users
	
	public Conversation retrieveConversation(int participantAId, int participantBId) {
	    Conversation conversation = null;
	    ICredentialsDao dao = new CredentialsDAO();

	    try (Connection conn = MySqlConnection.getconnectionmysql();
	         PreparedStatement stmt = conn.prepareStatement(
	                 "SELECT id_conv, date_creation " +
	                 "FROM conversation " +
	                 "WHERE participantA = ? AND participantB = ?"
	         )) {

	        // Set the participant IDs in the prepared statement
	        stmt.setInt(1, participantAId);
	        stmt.setInt(2, participantBId);

	        try (ResultSet rs = stmt.executeQuery()) {
	            // Check if a conversation record is found
	            if (rs.next()) {
	                // Create a Conversation object
	                conversation = new Conversation();
	                conversation.setId_conv(rs.getInt("id_conv"));
	                conversation.setDateConv(rs.getDate("date_creation"));
	                conversation.setParticipantA(dao.getutilById(participantAId));
	                conversation.setParticipantB(dao.getutilById(participantBId));
	                conversation.setMessages(dao.ListeMessagesByconvId(rs.getInt("id_conv")));
	            }
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return conversation;
	}


	
	//insert new conversation 
	public int insertNewConversation(int idMessageBox, int id_sender, int id_received) {
	    int conversationId = -1;
	    String query = "INSERT INTO conversation (id_message_box, participantA, participantB) " +
	                   "VALUES (?, ?, ?)";

	    try (Connection con = MySqlConnection.getconnectionmysql();
	         PreparedStatement statement = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {

	        statement.setInt(1, idMessageBox);
	        statement.setInt(2, id_sender);
	        statement.setInt(3, id_received);

	        int rowsAffected = statement.executeUpdate();

	        if (rowsAffected > 0) {
	            ResultSet generatedKeys = statement.getGeneratedKeys();
	            if (generatedKeys.next()) {
	                conversationId = generatedKeys.getInt(1);
	            }
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return conversationId;
	}

	//return all message in one conversation by id 
	public List<Message> ListeMessagesByconvId(int id_con) {
	    List<Message> listeMesga = new ArrayList<>();
	    dao = new CredentialsDAO();
	    String query = "SELECT * FROM message WHERE conversation_app = ?";
	    
	    try (Connection con = MySqlConnection.getconnectionmysql();
	         PreparedStatement ps = con.prepareStatement(query)) {

	        ps.setInt(1, id_con);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            Message m = new Message();
	            m.setId_message(rs.getInt("id_message"));
	            m.setContenue(rs.getString("contenue"));
	            
	            SimpleDateFormat dateFormat = new SimpleDateFormat("dd HH:mm");
	            java.sql.Timestamp timestamp = rs.getTimestamp("dateEnvoi");
	            String formattedDate = dateFormat.format(timestamp);
	            m.setDateEnvoi(formattedDate);
	            
	            m.setExpediteur(dao.getutilById(rs.getInt("expediteur")));
	            m.setProprietaire(dao.getutilById(rs.getInt("proprietaire")));
	            listeMesga.add(m);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return listeMesga;
	}

	//retoourner une conversation by id
	public Conversation getconvById(int id_conv) {
	    Conversation con = null;
	    dao = new CredentialsDAO();
	    String sql = "SELECT * FROM conversation WHERE id_conv = ?";
	    
	    try (Connection connexion = MySqlConnection.getconnectionmysql();
	         PreparedStatement statement = connexion.prepareStatement(sql)) {
	        
	        statement.setInt(1, id_conv);
	        ResultSet rs = statement.executeQuery();

	        if (rs.next()) {
	            con = new Conversation();
	            con.setId_conv(id_conv);
	            con.setDateConv(rs.getDate("date_creation"));
	            con.setParticipantA(dao.getutilById(rs.getInt("participantA")));
	            con.setParticipantB(dao.getutilById(rs.getInt("participantB")));
	            con.setMessages(dao.ListeMessagesByconvId(id_conv));
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    
	    return con;
	}

	//get id messageBox for an user
	
	public int getMessageBoxId(int userId) {
	    int messageBoxId = 0;

	    try (Connection connection = MySqlConnection.getconnectionmysql();
	         PreparedStatement statement = connection.prepareStatement("SELECT id_message_box FROM messagebox WHERE id_util = ?")) {

	        statement.setInt(1, userId);
	        ResultSet result = statement.executeQuery();

	        if (result.next()) {
	            messageBoxId = result.getInt("id_message_box");
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return messageBoxId;
	}


	//check if a conversation existe if not create it and return id 
	
	
	public int checkOrCreateConversation(int participantA, int participantB, int id_messageBox) {
	    int conversationId = 0;

	    try (Connection connection = MySqlConnection.getconnectionmysql()) {
	        PreparedStatement checkStatement = connection.prepareStatement("SELECT id_conv FROM conversation WHERE participantA = ? AND participantB = ?");
	        checkStatement.setInt(1, participantA);
	        checkStatement.setInt(2, participantB);
	        ResultSet result = checkStatement.executeQuery();

	        if (result.next()) {
	            conversationId = result.getInt("id_conv");
	        } else {
	            PreparedStatement createStatement = connection.prepareStatement("INSERT INTO conversation (participantA, participantB, id_message_box) VALUES (?, ?, ?)", PreparedStatement.RETURN_GENERATED_KEYS);
	            createStatement.setInt(1, participantA);
	            createStatement.setInt(2, participantB);
	            createStatement.setInt(3, id_messageBox);
	            createStatement.executeUpdate();

	            ResultSet generatedKeys = createStatement.getGeneratedKeys();
	            if (generatedKeys.next()) {
	                conversationId = generatedKeys.getInt(1);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return conversationId;
	}


	 //return the liste of conversation in one Mesages Box
	public List<Conversation> ConversationsInMesageBox(int id_messageBox) {
	    List<Conversation> listeConv = new ArrayList<>();
	     dao = new CredentialsDAO();
	    String sql = "SELECT * FROM conversation WHERE id_message_box=? order by id_conv  desc";
	    Connection con = null;
	    PreparedStatement statement = null;
	    ResultSet rs = null;

	    try {
	        con = MySqlConnection.getconnectionmysql();
	        statement = con.prepareStatement(sql);
	        statement.setInt(1, id_messageBox);
	        rs = statement.executeQuery();

	        while (rs.next()) {
	            Conversation c = new Conversation();
	            c.setId_conv(rs.getInt("id_conv"));
	            c.setParticipantA(dao.getutilById(rs.getInt("participantA")));
	            c.setParticipantB(dao.getutilById(rs.getInt("participantB")));
	            c.setDateConv(rs.getDate("date_creation"));
	            c.setMessages(dao.ListeMessagesByconvId(rs.getInt("id_conv")));
	            listeConv.add(c);
	        }
	    } catch (SQLException e) {
	        // Handle the exception or log the error
	        e.printStackTrace();
	    } finally {
	        // Close the resources in the finally block
	        try {
	            if (rs != null) {
	                rs.close();
	            }
	            if (statement != null) {
	                statement.close();
	            }
	            if (con != null) {
	                con.close();
	            }
	        } catch (SQLException e) {
	            // Handle the exception or log the error
	            e.printStackTrace();
	        }
	    }

	    return listeConv;
	}

	
	public boolean searchKeyInMap(Map<Integer, Float> map, Integer key) {
	    return map.containsKey(key);
	}
	
	public int getLocationIdIfExists(String city, String region, String country) {
	    int locationId = -1;

	    try (Connection con = MySqlConnection.getconnectionmysql();
	         PreparedStatement statement = con.prepareStatement("SELECT id_localisation FROM localisation WHERE ville = ? AND region = ? AND paye = ?")) {

	        statement.setString(1, city);
	        statement.setString(2, region);
	        statement.setString(3, country);

	        ResultSet resultSet = statement.executeQuery();
	        if (resultSet.next()) {
	            locationId = resultSet.getInt("id_localisation");
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return locationId;
	}

	// les postes laquelles utilisateur est le contributeurs 
	
	public List<Poste> MesContributions(int id_util) {
	    List<Poste> mescontributions = new ArrayList<>();

	    try (Connection con = MySqlConnection.getconnectionmysql();
	         PreparedStatement ps = con.prepareStatement("SELECT poste_cible FROM donation WHERE donateur = ?")) {

	        ps.setInt(1, id_util);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            Poste p = getPosteById(rs.getInt("poste_cible"));
	            mescontributions.add(p);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return mescontributions;
	}

	
	
	// get poste by id poste
	public Poste getPosteById(int id_poste) {
	    Poste p = null;

	    try (Connection connection = MySqlConnection.getconnectionmysql();
	         PreparedStatement ps = connection.prepareStatement("SELECT * FROM poste WHERE id_poste = ?")) {

	        ps.setInt(1, id_poste);
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            p = new Poste();
	            p.setId_poste(id_poste);
	            p.setNomProjet(rs.getString("nomProjet"));
	            p.setCategorie(rs.getString("categorie"));
	            p.setDateDeCreation(rs.getDate("dateDeCreation"));
	            p.setDateExpiration(rs.getDate("dateExpiration"));
	            p.setContributeurs(contributeursByIdPoste(id_poste));
	            p.setCreateur(getutilById(rs.getInt("createur")));
	            p.setImages(getlisImgaByidPoste(id_poste));
	            p.setVilleCiblee(rs.getString("villeCiblee"));
	            p.setDescription(rs.getString("description"));
	            p.setFonds(rs.getFloat("fonds"));
	            p.setObjectifDuFond(rs.getFloat("objectifDuFond"));
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return p;
	}

	// les postes qui crée un utilisateur par id
	public List<Poste> MesProjets(int id_util) {
	    List<Poste> mesprojets = new ArrayList<>();

	    try (Connection connection = MySqlConnection.getconnectionmysql();
	         PreparedStatement ps = connection.prepareStatement("SELECT * FROM poste WHERE createur = ?")) {

	        ps.setInt(1, id_util);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            Poste p = getPosteById(rs.getInt("id_poste"));
	            mesprojets.add(p);
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return mesprojets;
	}

	
	// les fonds un poste
	public float SumFondByPoste(int id) {
		float somme=0;
		for (Float value : SumDonByUtilByPoste(id).values()) {
		    somme+=value;
		}
		return somme;
		
	}
	
	//chaque poste on doit retourner pour chaque contributeur la somme des donations
	public Map<Integer, Float> SumDonByUtilByPoste(int id) {
	    Map<Integer, Float> DonByusers = new HashMap<>();

	    try (Connection connection = MySqlConnection.getconnectionmysql();
	         PreparedStatement ps = connection.prepareStatement("SELECT donateur, SUM(montant) AS fonds FROM donation WHERE poste_cible = ? GROUP BY donateur")) {

	        ps.setInt(1, id);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            DonByusers.put(rs.getInt("donateur"), rs.getFloat("fonds"));
	        }

	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return DonByusers;
	}

	
	//get utilisateur by his id 
	public Utilisateur getutilById(int id) {
	    Utilisateur u = null;

	    try (Connection connection = MySqlConnection.getconnectionmysql();
	         PreparedStatement statement = connection.prepareStatement("SELECT * FROM Utilisateur WHERE id_util = ?")) {

	        statement.setInt(1, id);
	        ResultSet resultSet = statement.executeQuery();

	        if (resultSet.next()) {
	            u = new Utilisateur();
	            u.setId_util(resultSet.getInt("id_util"));
	            u.setImageProfile(resultSet.getString("imageProfile"));
	            u.setRole(resultSet.getString("role"));
	            u.setLogin(resultSet.getString("login"));
	            u.setPassword(resultSet.getString("password"));
	            u.setNom(resultSet.getString("nom"));
	            u.setPrenom(resultSet.getString("prenom"));
	            u.setDateInscription(resultSet.getDate("dateInscription"));
	            InformationsPersonnels ip = getIPbyId(resultSet.getInt("infos_pers"));
	            u.setInformationsPersonnels(ip);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return u;
	}


	// liste  des images d'un postes
	public Set<Image> getlisImgaByidPoste(int id_poste) {
	    Set<Image> limages = new LinkedHashSet<>();

	    try (Connection connection = MySqlConnection.getconnectionmysql();
	         PreparedStatement ps = connection.prepareStatement("SELECT * FROM image WHERE poste_cible = ?")) {

	        ps.setInt(1, id_poste);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            Image img = new Image();
	            img.setId_img(rs.getInt("id_image"));
	            img.setImageData(rs.getString("imageData"));
	            limages.add(img);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return limages;
	}

	// chercher un poste par nom et ville et ctegorie
	 public  List<Poste> search(String city, String name, String category) {
	        

	        List<Poste> listeS=new ArrayList<Poste>();
	        String query = "SELECT * FROM poste WHERE 1=1";
	        if (city != null && !city.isEmpty()) {
	            query += " AND villeCiblee = ?";
	        }
	        if (name != null && !name.isEmpty()) {
	            query += " AND nomProjet LIKE ?";
	        }
	        if (category != null && !category.isEmpty()) {
	            query += " AND categorie = ?";
	        }

	        try {
	            // Create a database connection
	            Connection conn = MySqlConnection.getconnectionmysql();
	            PreparedStatement statement = conn.prepareStatement(query);

	            // Set the query parameters
	            int parameterIndex = 1;
	            if (city != null && !city.isEmpty()) {
	                statement.setString(parameterIndex++, city);
	            }
	            if (name != null && !name.isEmpty()) {
	                statement.setString(parameterIndex++, "%" + name + "%");
	            }
	            if (category != null && !category.isEmpty()) {
	                statement.setString(parameterIndex, category);
	            }

	            // Execute the query
	            ResultSet rs = statement.executeQuery();

	            // Process the result set
	            while (rs.next()) {
	               Poste p=new Poste();
	              //functions
	               p.setContributeurs(contributeursByIdPoste(rs.getInt("id_poste")));//liste des contributeurs
	               p.setImages(getlisImgaByidPoste(rs.getInt("id_poste")));
	             
	               p.setCreateur(getutilById(rs.getInt("createur")));
	               //rs
	               p.setCategorie(rs.getString("categorie"));
	               p.setDateDeCreation((Date)rs.getDate("dateDeCreation"));
	               p.setDateExpiration((Date)rs.getDate("dateExpiration"));
	               p.setFonds(rs.getFloat("fonds"));
	               p.setId_poste(rs.getInt("id_poste"));
	               
	               p.setVilleCiblee(rs.getString("villeCiblee"));
	               p.setNomProjet(rs.getString("nomProjet"));
	               p.setObjectifDuFond(rs.getFloat("objectifDuFond"));
	              
	                listeS.add(p);

	              
	            }

	           
	            rs.close();
	            statement.close();
	            conn.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
			return listeS;
	    }
	 // liste des contributeurs par  poste 
	 public List<Utilisateur> contributeursByIdPoste(int id) {
		    List<Utilisateur> contributeurs = new ArrayList<>();

		    try (Connection connection = MySqlConnection.getconnectionmysql();
		         PreparedStatement ps = connection.prepareStatement("SELECT donateur FROM donation WHERE poste_cible = ? GROUP BY donateur")) {

		        ps.setInt(1, id);
		        ResultSet rs = ps.executeQuery();

		        while (rs.next()) {
		            Utilisateur u = getutilById(rs.getInt("donateur"));
		            contributeurs.add(u);
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }

		    return contributeurs;
		}

	 // retourner une adresse par id
	 public Localisation getlocById(int id) {
		    Localisation l = new Localisation();

		    try (Connection connection = MySqlConnection.getconnectionmysql();
		         PreparedStatement statement = connection.prepareStatement("SELECT * FROM localisation WHERE id_localisation=?")) {

		        statement.setInt(1, id);
		        ResultSet rs = statement.executeQuery();

		        if (rs.next()) {
		            l.setId_loc(id);
		            l.setPaye(rs.getString("paye"));
		            l.setVille(rs.getString("ville"));
		            l.setRegion(rs.getString("region"));
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }

		    return l;
		}

	 // get personnels infos by id 
	 public InformationsPersonnels getIPbyId(int id) {
		    InformationsPersonnels ip = null;

		    try (Connection connection = MySqlConnection.getconnectionmysql();
		         PreparedStatement statement = connection.prepareStatement("SELECT * FROM InformationsPersonnels WHERE id_inf_pers=?")) {

		        statement.setInt(1, id);
		        ResultSet rs = statement.executeQuery();

		        if (rs.next()) {
		            ip = new InformationsPersonnels();
		            ip.setId_info_perso(id);
		            ip.setDateExpRib(rs.getDate("dateExpRib"));
		            ip.setAge(rs.getInt("age"));
		            ip.setTel(rs.getString("tel"));
		            ip.setLinkedinUrl(rs.getString("linkedinUrl"));
		            ip.setMailUrl(rs.getString("mailUrl"));
		            ip.setLinkedinUrl(rs.getString("linkedinUrl"));
		            ip.setRib(rs.getString("rib"));
		            ip.setTypeCreditCard(rs.getString("typeCreditCard"));
		            Localisation adress = getlocById(rs.getInt("adresse"));
		            ip.setAdresse(adress);
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }

		    return ip;
		}

//
	 public Utilisateur estAuthentifiee(String username, String password) {
		    Utilisateur u = null;

		    try (Connection connection = MySqlConnection.getconnectionmysql();
		         PreparedStatement statement = connection.prepareStatement("SELECT * FROM Utilisateur WHERE login = ? AND password = ?")) {

		        statement.setString(1, username);
		        statement.setString(2, password);
		        ResultSet resultSet = statement.executeQuery();

		        if (resultSet.next()) {
		            u = new Utilisateur();
		            u.setId_util(resultSet.getInt("id_util"));
		            u.setImageProfile(resultSet.getString("imageProfile"));
		            u.setRole(resultSet.getString("role"));
		            u.setLogin(resultSet.getString("login"));
		            u.setPassword(resultSet.getString("password"));
		            u.setNom(resultSet.getString("nom"));
		            u.setPrenom(resultSet.getString("prenom"));
		            u.setDateInscription(resultSet.getDate("dateInscription"));
		            u.setInformationsPersonnels(getIPbyId(resultSet.getInt("infos_pers")));
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }

		    return u;
		}

	

	 public int insertImagesforPoste(Image img, int id_poste) {
		    int test = 0;
		    String imageName = img.getImageData();
		    String uploadPath = "D:/formater/S6 SMI/TDs/JEE/pfe/src/main/webapp/imagesPostes/" + imageName;

		    try (FileOutputStream fos = new FileOutputStream(uploadPath);
		         InputStream is = img.getPart().getInputStream()) {

		        byte[] data = new byte[is.available()];
		        is.read(data);
		        fos.write(data);
		    } catch (IOException e) {
		        e.printStackTrace();
		    }

		    String sql = "INSERT INTO image (poste_cible, imageData) VALUES (?, ?)";

		    try (Connection connection = MySqlConnection.getconnectionmysql();
		         PreparedStatement ps = connection.prepareStatement(sql)) {

		        ps.setInt(1, id_poste);
		        ps.setString(2, imageName);
		        test = ps.executeUpdate();
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }

		    return test;
		}




	 public int insertUtilisateur(Utilisateur utilisateur) {
		    int test = 0;

		    try (Connection connection = MySqlConnection.getconnectionmysql()) {
		        String maxInfQuery = "SELECT MAX(id_inf_pers) AS max_idinf FROM informationspersonnels";
		        PreparedStatement maxInfStatement = connection.prepareStatement(maxInfQuery);
		        ResultSet maxInfResult = maxInfStatement.executeQuery();
		        int maxIdInf = 0;
		        if (maxInfResult.next()) {
		            maxIdInf = maxInfResult.getInt("max_idinf");
		        }

		        String query = "INSERT INTO Utilisateur (imageProfile, login, password, nom, prenom, infos_pers) " +
		                "VALUES (?, ?, ?, ?, ?, ?)";

		        PreparedStatement statement = connection.prepareStatement(query);
		        String imgProfile = utilisateur.getImageProfile();
		        String uploadPath = "D:/formater/S6 SMI/TDs/JEE/pfe/src/main/webapp/images/" + imgProfile;
		        Part file = utilisateur.getFilereq();
		        try (FileOutputStream fos = new FileOutputStream(uploadPath);
		             InputStream is = file.getInputStream()) {

		            byte[] data = new byte[is.available()];
		            is.read(data);
		            fos.write(data);
		        } catch (IOException e) {
		            e.printStackTrace();
		        }

		        statement.setString(1, utilisateur.getImageProfile());
		        statement.setString(2, utilisateur.getLogin());
		        statement.setString(3, utilisateur.getPassword());
		        statement.setString(4, utilisateur.getNom());
		        statement.setString(5, utilisateur.getPrenom());
		        statement.setInt(6, maxIdInf);

		        test = statement.executeUpdate();
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }

		    return test;
		}

	
	 public int affectMessageBoxToUser() {
		    int test = 0;

		    try (Connection connection = MySqlConnection.getconnectionmysql()) {
		        String maxIdQuery = "SELECT MAX(id_util) AS max_id FROM utilisateur";
		        String insertQuery = "INSERT INTO messagebox (id_util) VALUES (?)";

		        PreparedStatement maxIdStatement = connection.prepareStatement(maxIdQuery);
		        ResultSet maxIdResult = maxIdStatement.executeQuery();
		        PreparedStatement insertStatement = connection.prepareStatement(insertQuery);

		        if (maxIdResult.next()) {
		            int maxId = maxIdResult.getInt("max_id");
		            insertStatement.setInt(1, maxId);
		            test = insertStatement.executeUpdate();
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }

		    return test;
		}

	 public int insertPoste(Poste poste, Utilisateur createur) {
		    try (Connection connection = MySqlConnection.getconnectionmysql()) {
		        String query = "INSERT INTO Poste (objectifDuFond, dateExpiration, categorie, fonds, villeCiblee, nomProjet, createur, description) " +
		                       "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

		        PreparedStatement statement = connection.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);
		        statement.setFloat(1, poste.getObjectifDuFond());
		        statement.setDate(2, new java.sql.Date(poste.getDateExpiration().getTime()));
		        statement.setString(3, poste.getCategorie());
		        statement.setFloat(4, poste.getFonds());
		        statement.setString(5, poste.getVilleCiblee());
		        statement.setString(6, poste.getNomProjet());
		        statement.setInt(7, createur.getId_util());
		        statement.setString(8, poste.getDescription());

		        int rowsAffected = statement.executeUpdate();
		        if (rowsAffected > 0) {
		            ResultSet generatedKeys = statement.getGeneratedKeys();
		            if (generatedKeys.next()) {
		                int postId = generatedKeys.getInt(1);
		                System.out.println("Poste inserted successfully. Post ID: " + postId);
		                return postId;
		            }
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }

		    return -1; // Return -1 if insertion failed
		}

    
	
	
	
	 public int insertLocalisation(Localisation localisation) {
		    int test = 0;
		    try (Connection connection = MySqlConnection.getconnectionmysql()) {
		        String query = "INSERT INTO Localisation (paye, ville, region) " +
		                       "VALUES (?, ?, ?)";

		        PreparedStatement statement = connection.prepareStatement(query);
		        statement.setString(1, localisation.getPaye());
		        statement.setString(2, localisation.getVille());
		        statement.setString(3, localisation.getRegion());

		        test = statement.executeUpdate();
		    } catch (SQLException e) {
		        e.printStackTrace();
		    }
		    return test;
		}

	
    public  int insertInformationsPersonnels(InformationsPersonnels informationsPersonnels,Localisation adresse) {
    	int test=0;
    	
    	
    	
        try (Connection  connection=MySqlConnection.getconnectionmysql()) {
        	
        	
        	
            String query = "INSERT INTO InformationsPersonnels (age, linkedinUrl, mailUrl, tel, rib, dateExpRib, typeCreditCard, pin,adresse) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?,  ?,?)";
          

            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, informationsPersonnels.getAge());
            statement.setString(2, informationsPersonnels.getLinkedinUrl());
            statement.setString(3, informationsPersonnels.getMailUrl());
            statement.setString(4, informationsPersonnels.getTel());
            statement.setString(5, informationsPersonnels.getRib());
            java.util.Date utilDate = informationsPersonnels.getDateExpRib();
            
            java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
            statement.setDate(6, sqlDate);
            
            statement.setString(7, informationsPersonnels.getTypeCreditCard());
            statement.setInt(8, informationsPersonnels.getPin());
            int id_adresse=getLocationIdIfExists(adresse.getVille(), adresse.getRegion(), adresse.getPaye());
            if(id_adresse==-1) {
        		insertLocalisation(adresse);
        	
            //ajouter id adresse if  l'adresse n'existe pas 
            String adrr="select Max(id_localisation) as max_adr from localisation;";
       	 PreparedStatement ps= connection.prepareStatement(adrr);
       	 ResultSet rs=ps.executeQuery();
       	 int id=0;
       	 if(rs.next()) {
       		  id =rs.getInt("max_adr");
       	 }
            
            statement.setInt(9, id);
            }
        else {
            	//if adresse existe déja dans la base de donnee
        	
        	statement.setInt(9, id_adresse);
            }
           test= statement.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        	
        return test;
    }
	
    public int insertDonation(donation donation) {
        int test = 0;
        try (Connection connection = MySqlConnection.getconnectionmysql()) {
            String query = "INSERT INTO donation (poste_cible, montant, donateur) " +
                           "VALUES (?, ?, ?)";

            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, donation.getPoste_cible().getId_poste());
            statement.setFloat(2, donation.getMontant());
            statement.setInt(3, donation.getUtilisateurB().getId_util());
            
            test = statement.executeUpdate();
            
            // Update the corresponding poste table
            
            String updateQuery = "UPDATE poste SET fonds = fonds + ? WHERE id_poste = ?";
            PreparedStatement updateStatement = connection.prepareStatement(updateQuery);
            updateStatement.setFloat(1, donation.getMontant());
            updateStatement.setInt(2, donation.getPoste_cible().getId_poste());
            updateStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return test;
    }

    
   
    
    

    public int insertMessage(Message message,Conversation conversation) {
    	int test=0;
        try (Connection connection = MySqlConnection.getconnectionmysql()) {
            String query = "INSERT INTO Message ( proprietaire, contenue, expediteur,  conversation_app) " +
                    "VALUES (?, ?, ?, ?)";
           

            PreparedStatement statement = connection.prepareStatement(query);
            
           
            statement.setInt(1, message.getProprietaire().getId_util());
            statement.setString(2, message.getContenue());
            statement.setInt(3, message.getExpediteur().getId_util());
          
            statement.setInt(4, conversation.getId_conv());
           test= statement.executeUpdate();
            System.out.println("Message inserted successfully.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return test;
        
    }
    
    
    public int deleteMessage(int messageId) {
    	int test=0;
        try (Connection connection = MySqlConnection.getconnectionmysql()) {
            String query = "DELETE FROM Message WHERE id_message = ?";

            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, messageId);

            test = statement.executeUpdate();
           
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return test;
    }
   
    public  int deleteDonation(int id_donation) {
    	int test=0;
        try (Connection  connection=MySqlConnection.getconnectionmysql()) {
            String query = "DELETE FROM donation WHERE id_donation = ?";

            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, id_donation);

           test= statement.executeUpdate();
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return test;
    }
    public int deleteUtilisateur(int utilisateurId) {
        int test = 0;
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = MySqlConnection.getconnectionmysql();
            String query = "DELETE FROM Utilisateur WHERE id_util = ?";

            statement = connection.prepareStatement(query);
            statement.setInt(1, utilisateurId);

            test = statement.executeUpdate();
            System.out.println("Utilisateur deleted successfully.");
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close the statement and connection in a finally block to ensure they are always closed
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return test;
    }

    
    public int deletePoste(int postId) {
        int test = 0;
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = MySqlConnection.getconnectionmysql();
            String query = "DELETE FROM Poste WHERE id_poste = ?";

            statement = connection.prepareStatement(query);
            statement.setInt(1, postId);

            test = statement.executeUpdate();
            System.out.println("Poste deleted successfully.");
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close the statement and connection in a finally block to ensure they are always closed
            if (statement != null) {
                try {
                    statement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return test;
    }

    
    
    public List<Poste> allPoste2() {
        List<Poste> allPostes = new ArrayList<>();

        try (Connection connection = MySqlConnection.getconnectionmysql()) {
            String sql = "SELECT p.*, u.* " +
                         "FROM poste p " +
                         "JOIN utilisateur u ON p.createur = u.id_util";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Poste poste = getPosteById(rs.getInt("id_poste"));

                Utilisateur createur = getutilById(rs.getInt("id_util"));
                
                poste.setCreateur(createur);

                allPostes.add(poste);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return allPostes;
    }

	
	public List<Poste> allPoste(){
		List<Poste> allpostes=new ArrayList<>();
		try (Connection  connection=MySqlConnection.getconnectionmysql()){
			String sql="select * from poste ";
			PreparedStatement ps=connection.prepareStatement(sql);
			ResultSet  rs=ps.executeQuery();
			while(rs.next()) {
				Poste poste=getPosteById(rs.getInt("id_poste"));
				allpostes.add(poste);
				
			}
		}catch(SQLException e) {}
		return allpostes;
	}
	
	//the postes where the use donnate but it's dupplicates 
	public List<Poste> getDonationPostesDup(int id_util) {
        List<Poste> donationPostes = new ArrayList<>();
        
        try (Connection connection =MySqlConnection.getconnectionmysql() ) {
            String sql = "SELECT poste.* " +
                    "FROM poste " +
                    "JOIN donation ON donation.poste_cible = poste.id_poste " +
                    "WHERE donation.donateur = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id_util);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Poste poste = new Poste();
                poste=getPosteById(resultSet.getInt("id_poste"));
               
               

                donationPostes.add(poste);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return donationPostes;
    }
	public Set<Poste> getDonationPostes(int id_util) {
        Set<Poste> donationPostes = new TreeSet<Poste>(new Comparator<Poste>() {
        	
        	@Override
        	public int compare(Poste o1, Poste o2) {
        		
        		return o1.getId_poste()-o2.getId_poste();
        	}
        });
        
        try (Connection connection =MySqlConnection.getconnectionmysql() ) {
            String sql = "SELECT poste.* " +
                    "FROM poste " +
                    "JOIN donation ON donation.poste_cible = poste.id_poste " +
                    "WHERE donation.donateur = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id_util);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Poste poste = new Poste();
                poste=getPosteById(resultSet.getInt("id_poste"));
               
               

                donationPostes.add(poste);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return donationPostes;
    }

	
	public List<donation> getDonationsByUserAndPost(int id_util, int id_poste) {
		List<donation> donations = new ArrayList<>();
       
		
		try (Connection connection =MySqlConnection.getconnectionmysql()) {
            String sql = "SELECT * FROM donation WHERE donateur = ? AND poste_cible = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, id_util);
            statement.setInt(2, id_poste);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                donation donation = new donation();
                donation.setId_donation(resultSet.getInt("id_donation"));
                Poste p=getPosteById(resultSet.getInt("poste_cible"));
                donation.setPoste_cible(p);
                donation.setMontant(resultSet.getFloat("montant"));
                donation.setDateDonation(resultSet.getDate("dateDonation"));
                Utilisateur donateur=getutilById(resultSet.getInt("donateur"));
                donation.setUtilisateurB(donateur);
                donations.add(donation);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

		return donations;
	}
	
	
}





