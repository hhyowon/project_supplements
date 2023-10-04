<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page import="java.util.HashMap, java.util.ArrayList" %>
        <!DOCTYPE html>
        <html lang="en">
        <%@ include file="/WEB-INF/views/etc/Header.jsp" %>

        <body>
                    <%
                    String surveyTypeId = ""; 
                    HashMap params = (HashMap) request.getAttribute("params"); 
                    String searchStr = (String) params.getOrDefault("search", ""); 
                    HashMap result = (HashMap) request.getAttribute("result");
                    ArrayList resultList = (ArrayList) result.get("resultList");
                    
                    if (!resultList.isEmpty()) {
                        HashMap firstRecord = (HashMap) resultList.get(0);
                        surveyTypeId = (String) firstRecord.get("SURVEY_TYPE_ID"); // surveyTypeId 값을 설정
                    }
                    %>
                    <div class="container">
                        <div class=text-center>
                            <h3>  
                                <%
                                if ("F-01".equals(surveyTypeId)) {
                                %>
                                    복용 경험이 없는 사람의 통계
                                <%
                                } else if ("F-02".equals(surveyTypeId)) {
                                %>
                                    복용 경험이 있는 사람의 통계 
                                <%
                                }
                                %>
                            </h3>
                        </div>
                        <br>
                        <table class="table table-bordered ">
                            <thead>
                                <tr>
                                    <th class=text-center>
                                        <h5 style="color: #5B9BD5;">질문</h5>
                                    </th>
                                    <th class=text-center>
                                        <h5 style="color: #5B9BD5;">답변</h5>
                                    </th>
                                    <th class=text-center>
                                        <h5 style="color: #5B9BD5;">답변자 수 </h5>
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                <% ArrayList resultList=(ArrayList)result.get("resultList"); String previousquestion=""
                                    ; for (int i=0; i < resultList.size(); i++) {HashMap
                                    record=(HashMap)resultList.get(i); String
                                    surveyquestion=(String)record.get("SURVEY_QUESTION"); String
                                    surveyoption=(String)record.get("SURVEY_OPT"); Long
                                    surveycount=(Long)record.get("COUNT(*)"); %>
                                    <tr>
                                        <% if (!surveyquestion.equals(previousquestion)) { %>
                                            <td>
                                                <%= surveyquestion %>
                                            </td>
                                            <%previousquestion=surveyquestion;} else {previousquestion=surveyquestion;%>
                                                <td></td>
                                                <%} %>

                                                    <td>
                                                        <%= surveyoption %>
                                                    </td>
                                                    <td>
                                                        <%= surveycount %>
                                                    </td>
                                    </tr>
                                    <% } %>
                            </tbody>
                        </table>
                    </div>
                    </div>
                    <%@ include file="/WEB-INF/views/etc/Footer.jsp" %>

        </body>

        </html>