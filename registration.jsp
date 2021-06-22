<%@ page import ="java.sql.*" %>
<%
String user = request.getParameter("uname");    
String pwd = request.getParameter("pass");
String RePwd = request.getParameter("retype_password");
String fname = request.getParameter("fname");
String lname = request.getParameter("lname");
String email = request.getParameter("email");
String Adhaar = request.getParameter("adhaar_no");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test100",
"root", "root");
Statement st = con.createStatement();
//ResultSet rs;
int i = st.executeUpdate("insert into members(first_name, last_name, email, uname, pass, retype_password, adhaar_no, regdate) values ('" + fname + "','" + lname + "','" + email + "','" + user + "','" + pwd + "','" + RePwd + "','" + Adhaar +"', CURDATE())");
if (i > 0 && pwd.equals(RePwd)) {
//session.setAttribute("userid", user);
response.sendRedirect("welcome.jsp");
// out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
} else {
out.println("password not matched <a href='index.jsp'>Try Again</a>");
}
%>