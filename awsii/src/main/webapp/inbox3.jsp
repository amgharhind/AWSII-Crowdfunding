<%@page import="dao.CredentialsDAO"%>
<%@page import="dao.ICredentialsDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="entities.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
   <title> awsii moroccan Platforme</title>
    <link rel="shortcut icon" href="assets/img/Hind-21-01.png" title="Favicon" sizes="16x16" />
    <link rel="stylesheet" href="assets/css/inbox2.css">
    <link rel="stylesheet" href="assets/css/lib/all.min.css"/>
  </head>
  <body>
   <%
 Utilisateur moi=(Utilisateur)session.getAttribute("moi");
ICredentialsDao dao= new CredentialsDAO();
int messageBoxId = dao.getMessageBoxId(moi.getId_util());
List<Conversation> conversations = dao.ConversationsInMesageBox(messageBoxId);
 
%>
    <div class="header">
      <div class="logo">
        <img src="assets/img/LOGO TWIL (1)/logo.png" alt="Logo awsii">
        
      </div>
    
       <% if (moi!=null) {%>
      <div class="user">
        <img src="<%=moi.getImageProfile()%>" alt="User Avatar">
        <span><%=moi.getLogin()%></span>
        
      </div>
      <%} %>
    </div>
    <div class="container">
     
      <div class="sidebar">
        <div class="chats">
      
            <% if (conversations.size()==1&&!conversations.isEmpty()) { 
        	Conversation conversation = conversations.get(0);
            Conversation conv=dao.retrieveConversation(moi.getId_util(), conversation.getParticipantB().getId_util());
           %>
           
           
        
        
        <div class="chat active">
            <img src="<%= conversation.getParticipantB().getImageProfile() %>" alt="User Avatar">
            <div class="chat-details">
              <h2><a href="selectedchat?id_conversation=<%=conversation.getId_conv()%>" style="color:white;text-decoration:none">
              
              <%= conversation.getParticipantB().getLogin()%></a></h2>
              <% 
              
              Message m=dao.getLastMessageObj(conversation.getId_conv()) ;%>
              <p><%= m.getContenue() %></p>
            </div>
            <div class="chat-timestamp">
              <span><%= m.getDateEnvoi()%></span>
            </div>
          </div>
        
        <% }else{ for (int i = 0; i < conversations.size(); i++) { 
        	
        	Conversation conversation = conversations.get(i);
        Conversation conv=dao.retrieveConversation(moi.getId_util(), conversation.getParticipantB().getId_util());
        List<Message> messages=dao.ListeMessagesByconvId(conv.getId_conv());
        if(!messages.isEmpty()){
        %>
        
        
   <% if (i == 0) { %>
          <div class="chat active">
            <img src="<%= conversation.getParticipantB().getImageProfile() %>" alt="User Avatar">
            <div class="chat-details">
              <h2><a href="selectedchat?id_conversation=<%=conversation.getId_conv()%>" style="color:white;text-decoration:none">
              
              <%= conversation.getParticipantB().getLogin() %></a></h2>
              <% 
              
              Message m=dao.getLastMessageObj(conversation.getId_conv()) ;%>
              <p><%= m.getContenue() %></p>
            </div>
            <div class="chat-timestamp">
              <span><%= m.getDateEnvoi()%></span>
            </div>
          </div>
          <% } else { %>
             <div class="chat">
            <img src="<%= conversation.getParticipantB().getImageProfile() %>" alt="User Avatar">
            <div class="chat-details">
              <h2><a href="selectedchat?id_conversation=<%=conversation.getId_conv()%>" style="color:white;text-decoration:none">
              
              <%= conversation.getParticipantB().getLogin() %></a></h2>
               <% 
              
              Message m=dao.getLastMessageObj(conversation.getId_conv()) ;%>
           <p><%= m.getContenue() %></p>
            </div>
            <div class="chat-timestamp">
              <span><%= m.getDateEnvoi() %></span>
            </div>
          </div>
          <% }} %>
           <% }} %>
         
        </div>
     
      </div>
     
     <% int conver=Integer.parseInt(request.getParameter("id_conversation")); 
     Conversation convselected=dao.getconvById(conver);
     %>
      <%if(convselected!=null) {%>
      <div class="content">
    
        <div class="chat-header">
          <img src="<%=convselected.getParticipantB().getImageProfile() %>" alt="User Avatar">
          <h2><%=convselected.getParticipantB().getLogin() %></h2>
        </div>
        <div class="chat-messages">
         
          <% 
    Conversation conv=dao.retrieveConversation(moi.getId_util(),convselected.getParticipantB().getId_util() );
    if(conv!=null){
    	
    List<Message> listeMessages=dao.ListeMessagesByconvId(conv.getId_conv());
    
    %>
    <%  for( Message m:listeMessages){
    
    if(m.getProprietaire().getId_util()==moi.getId_util()){ %>
          
          <div class="message sent">
            <div class="message-details">
              <span class="message-timestamp"><%=m.getDateEnvoi()%></span>
            </div>
            <div class="message-content recevoire">
              <p><%=m.getContenue()%></p>
            </div>
          </div>
          
           <%} else{%>
          <div class="message received">
            <div class="message-details">
              
              <span class="message-timestamp"><%=m.getDateEnvoi()%></span>
            </div>
            <div class="message-content envoyer">
              <p><%=m.getContenue()%></p>
            </div>
           
          </div>
           <%}}}%>
        </div>
        
        <form action="chatConv" method ="post">
        <div class="chat-input">
         <input type="text" name="sender" value="<%=moi.getId_util()%>" style="display:none"/>
           <input type="text" name="receiver" value="<%=convselected.getParticipantB().getId_util()%>" style="display:none"/>
           
          <textarea name="message" placeholder="Type your message" required></textarea>
          <button type="submit"><i class="fas fa fa-paper-plane"></i></button>
        </div>
        </form>
         
      </div>
   
   <%} %>
  
    </div>
   
    <script src="assets/js/inbox2.js"></script>
    
   
 

  
  </body>
</html>