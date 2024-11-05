package dao;
import java.util.List;
import java.util.Map;
import java.util.Set;
import entities.Conversation;
import entities.*;
import entities.InformationsPersonnels;
import entities.Localisation;
import entities.Message;
import entities.Poste;
import entities.Utilisateur;
import entities.donation;

public interface ICredentialsDao {
	public Message getLastMessageObj(int conversationId);
	Conversation getLastConversation(int userId);
	public List<Utilisateur> allUsers();
	public String getLastMessage(int conversationId);
	public Conversation LastConversation(int messageBoxId);
	public List<Conversation> ConversationsInMesageBox(int id_messageBox);
	public List<donation> getDonationsByUserAndPost(int id_util, int id_poste);
	public Set<Poste> getDonationPostes(int id_util) ;
	public List<Poste> getDonationPostesDup(int id_util) ;
	public boolean searchKeyInMap(Map<Integer, Float> map, Integer key) ;
	public int insertImagesforPoste(Image img,int id_poste);
public int getLocationIdIfExists(String city, String region, String country) ;
	
	// les postes laquelles utilisateur est le contributeurs 
	
	public List<Poste> MesContributions(int id_util);
	
	// get poste by id poste
	public Poste getPosteById(int id_poste) ;
	// les postes qui crée un utilisateur par id
	public  List<Poste> MesProjets( int id_util);
	// les fonds un poste
	public float SumFondByPoste(int id);
	//chaque poste on doit retourner pour chaque contributeur la somme des donations
	public Map<Integer,Float> SumDonByUtilByPoste( int id );
	
	//get utilisateur by his id 
	public Utilisateur getutilById(int id) ;

	// liste  des images d'un postes
	public Set<Image>  getlisImgaByidPoste( int id_poste);
	// chercher un poste par nom et ville et ctegorie
	 public  List<Poste> search(String city, String name, String category) ;
	 // liste des contributeurs par  poste 
	 public List<Utilisateur> contributeursByIdPoste( int id);
	 // retourner une adresse par id
	 public Localisation getlocById(int id) ;
	 // get personnels infos by id 
	public InformationsPersonnels getIPbyId(int id);
	    public Utilisateur estAuthentifiee(String username, String password) ;





	public int insertUtilisateur(Utilisateur utilisateur) ;
	
	public int affectMessageBoxToUser();
	
	public int insertPoste(Poste poste, Utilisateur createur) ;
	
	
	
    public  int insertLocalisation(Localisation localisation) ;
	
    public  int insertInformationsPersonnels(InformationsPersonnels informationsPersonnels,Localisation adresse);
    
	
    public  int insertDonation(donation donation) ;
   
    
    

    public int insertMessage(Message message,Conversation conversation) ;
    
    
    public int deleteMessage(int messageId);
   
    public  int deleteDonation(int id_donation);
    public int deleteUtilisateur(int utilisateurId);
    
    public int deletePoste(int postId);
	
    public Conversation retrieveConversation(int participantAId, int participantBId);
    public int getMessageBoxId(int userId);
	 
    public List<Poste> allPoste();
	public List<Message> ListeMessagesByconvId(int id_conv);
	
	public Conversation getconvById(int id_conv);
	public int checkOrCreateConversation(int participantA, int participantB,int id_messageBox);
	 
	;
}
