<%@page import="java.util.*"%>
<%@page import="redes2.*" %>
<%@page import="redes2.facade.*" %>
<%@page import="model.*" %>
<%@page import="util.*" %>
<%@page import="util.imp.*" %>
<%@page import="util.interfaces.*" %>
<%@page import="view.*" %>
<%
//Action
String action = request.getParameter("action");
if(action != null && !action.isEmpty()){
	if ("extContextDeletar".equals(action)) {
		//EXTContextFacade.deleteExtContext(request.getParameter("id"));
	} else if ("extContextSalvar".equals(action)) {
		String id = request.getParameter("id");
		String newId = request.getParameter("newId");
		
		ArrayList<String> numbersIdRequest = new ArrayList<String>();

		String[] numberIdRequest = request.getParameterValues("number//"+id);
		if(numberIdRequest != null){
			for(String str: numberIdRequest){
				if(str != null && !str.isEmpty()){
					numbersIdRequest.add(str);
				}
			}
		}
		
		numbersIdRequest.add("NOVO_NUMERO");
		
		String[] commandsRequest;
		
		ArrayList<EXTContextNumber> numbers = new ArrayList<EXTContextNumber>();
		ArrayList<String> commands = null;
		
		for(String number : numbersIdRequest){
			if(number != null && !number.isEmpty()){
				commandsRequest = request.getParameterValues("command//"+id+"//"+number);
				if(commandsRequest != null  && commandsRequest.length > 0){
					commands = new ArrayList<String>();
					for(String command : commandsRequest){
						if(command != null  && !command.isEmpty()){
							commands.add(command);
						}
					}
					if("NOVO_NUMERO".equals(number)){
						number = request.getParameter("number//NOVO_NUMERO");
					}
					numbers.add(new EXTContextNumber(number, commands));
				}
			}
		}
		
		EXTContextFacade.updateExtContext(id, new EXTContext(newId, numbers));
	}
}
%>