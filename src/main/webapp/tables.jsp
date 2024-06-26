<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="Crafter.TableInfo" %>
<%@ page import="Crafter.ColumnInfo" %>
<%@ page import="com.google.gson.Gson" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>SQLCrafter</title>
    
    <!-- Favicon -->
    <link rel="icon" href="${pageContext.request.contextPath}/resources/images/logo.png" type="image/x-icon">
    
    <!-- Latest Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.21.0/font/bootstrap-icons.css" rel="stylesheet">
    
<style>
    /* Add your custom styles here */
    body {
        background-color: #f8f9fa; /* Set a light background color */
    }

    .navbar {
        background-color: #17a2b8; /* Set a blue color for the header */
    }

    .footer {
        background-color: #343a40; /* Set a dark color for the footer */
        color: #ffffff; /* Set text color to white */
    }
    
    .btn-custom-color {
        background-color: #f8f9fa; /* Set a light background color */
        color: #ffffff; /* Text color (white in this example) */
    }
   /* .card-header-bg{
    	background-color: #17a2b8;
        color: #ffffff; 
    }*/
    
    #main {
        padding-bottom: 50px; /* Add padding to the bottom of the main content */
    }
    
    
</style>
    
</head>
<body class="d-flex flex-column min-vh-100">

<%
    try {
    	
    	System.out.println("INSIDE tables.JSP");
    	
        // Retrieve schema name from the request parameter
        String schemaName = request.getParameter("schema");

        // Display schema name
        System.out.println("Schema Name: " + schemaName);

        // Display tables here
%>

    <!-- Include the header -->
    <jsp:include page="header.jsp" />
    
<div id="wrap">


    <div id="main" class="container mt-0">
        
    <h2 class="d-flex justify-content-between" style="padding: 20px 20px;">Tables in Schema: <%= schemaName %>

    <input type="text" id="searchInput" class="form-control" style="width: 400px;" placeholder="Search table name...">

	</h2>

        <div class="row">
            <!-- Schema Info Card -->
            <div class="col-md-4">
                <div class="card mb-0 h-100" style="min-height: 100vh;">
                    <div class="card-body">
                        <h5 class="card-title">Schema Info</h5>
                        <p class="card-text">Schema Name: <%= schemaName %></p>
                        <!-- Add more schema info here if needed -->
                    </div>
                </div>
            </div>

            <!-- Tables List -->
            <div class="col-md-8">
                <div id="tablesList">
                    <div class="text-center">
                        <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>


</div>

    <!-- Bootstrap Footer -->
    <jsp:include page="footer.jsp" />

<!-- Bootstrap Modals -->
<!-- View Data Modal -->
<div class="modal fade" id="viewDataModal" tabindex="-1" aria-labelledby="viewDataModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="viewDataModalLabel">
                	<img src='${pageContext.request.contextPath}/resources/images/search.png' style='max-width: 35px; margin-right: 10px;' alt='view Icon'>
                	View Data
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Data display area -->
                view data here!!!
                <br>

                hehe
                <textarea class="form-control" id="ViewTableQuery" rows="5" placeholder="SQL Query..." readonly>DROP TABLE SCHEMA_NAME.TABLE_NAME</textarea>
                <!-- You can customize this section based on your requirements -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-outline-primary confirmView"><img src='${pageContext.request.contextPath}/resources/images/confirm.png' style='max-width: 20px; margin-right: 5px;' alt='Confirm Icon'>Confirm</button>
            </div>
        </div>
    </div>
</div>
<!-- Add Data Modal -->
<div class="modal fade" id="addDataModal" tabindex="-1" aria-labelledby="addDataModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="addDataModalLabel"><img src='${pageContext.request.contextPath}/resources/images/add.png' style='max-width: 35px; margin-right: 10px;' alt='add Icon'>Add Data</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Data display area -->
                add data here!!!
                <br>

                hehe
                <textarea class="form-control" id="AddTableQuery" rows="5" placeholder="SQL Query..." readonly>DROP TABLE SCHEMA_NAME.TABLE_NAME</textarea>
                <!-- You can customize this section based on your requirements -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-outline-primary confirmView" ><img src='${pageContext.request.contextPath}/resources/images/confirm.png' style='max-width: 20px; margin-right: 5px;' alt='Confirm Icon'>Confirm</button>
            </div>
        </div>
    </div>
</div>

<!-- update Data Modal -->
<div class="modal fade" id="updateDataModal" tabindex="-1" aria-labelledby="updateDataModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="updateDataModalLabel"><img src='${pageContext.request.contextPath}/resources/images/update.png' style='max-width: 35px; margin-right: 10px;' alt='update Icon'>Update Data</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Data display area -->
                update data here!!!
                <br>

                hehe
                <textarea class="form-control" id="UpdateTableQuery" rows="5" placeholder="SQL Query..." readonly>DROP TABLE SCHEMA_NAME.TABLE_NAME</textarea>
                <!-- You can customize this section based on your requirements -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-outline-primary confirmView" ><img src='${pageContext.request.contextPath}/resources/images/confirm.png' style='max-width: 20px; margin-right: 5px;' alt='Confirm Icon'>Confirm</button>
            </div>
        </div>
    </div>
</div>

<!-- delete Data Modal -->
<div class="modal fade" id="deleteDataModal" tabindex="-1" aria-labelledby="deleteDataModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteDataModalLabel"><img src='${pageContext.request.contextPath}/resources/images/delete.png' style='max-width: 35px; margin-right: 10px;' alt='delete Icon'>Delete Data</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Data display area -->
                delete data here!!!
                <br>

                hehe
                <textarea class="form-control" id="DeleteDataQuery" rows="5" placeholder="SQL Query..." readonly>DROP TABLE SCHEMA_NAME.TABLE_NAME</textarea>
                <!-- You can customize this section based on your requirements -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-outline-primary confirmView" ><img src='${pageContext.request.contextPath}/resources/images/confirm.png' style='max-width: 20px; margin-right: 5px;' alt='Confirm Icon'>Confirm</button>
            </div>
        </div>
    </div>
</div>

<!-- delete table Modal -->
<div class="modal fade" id="deleteTableModal" tabindex="-1" aria-labelledby="deleteTableModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="deleteTableModalLabel"><img src='${pageContext.request.contextPath}/resources/images/delete2.png' style='max-width: 35px; margin-right: 10px;' alt='delete Icon'>Delete Table</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Data display area -->
                Delete Table <> Query
                <br>
                <br>
                <br>
                <br>
                <textarea class="form-control" id="DeleteTableQuery" rows="5" placeholder="SQL Query..." readonly>DROP TABLE SCHEMA_NAME.TABLE_NAME</textarea>
                <!-- You can customize this section based on your requirements -->
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="button" class="btn btn-outline-primary confirmView" ><img src='${pageContext.request.contextPath}/resources/images/confirm.png' style='max-width: 20px; margin-right: 5px;' alt='Confirm Icon'>Confirm</button>
            </div>
        </div>
    </div>
</div>



<!-- Latest Bootstrap JS and Popper.js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<!-- tables-modal-functions -->
<script src="tables-modal-functions.js"></script>

<script>

var contextPath = "${pageContext.request.contextPath}";
var vSchema = "<%= schemaName %>";

$(document).ready(function() {
    //loader.
    $("#tablesList").html("<div class='text-center'><div class='spinner-border text-primary' style='width: 3rem; height: 3rem;' role='status'></div></div>");

    // Retrieve tables info using AJAX
    $.get("${pageContext.request.contextPath}/tables", { event:"GET_ALL_TABLES_FOR_SCHEMA", schema: "<%= schemaName %>" }, function(response) {
        // Parse JSON response
        var data = response.tables;
        var status = response.status;

        // Check if status is true and data is not empty
        if (status && data && data.length > 0) {
            // Render tables list
            var tablesList = $("#tablesList");
            tablesList.html(''); //remove the loader first
            for (var i = 0; i < data.length; i++) {
                var table = data[i];
                var html = "<div class='card mb-4'>";
                html += "<div class='card-header py-3 card-header-bg d-flex justify-content-between align-items-center'>";
                html += "<div class='d-flex align-items-center'>";
                html += "<img src='${pageContext.request.contextPath}/resources/images/table.png' class='img-fluid me-2' style='max-width: 40px;' alt='Table Icon'>";
                html += "<span style='margin-left: 10px;'><h4>" + table.tableName + "</h4></span>"; // Table name with left margin
                html += "</div>"; // End of image and table name container
                html += "<div>"; // Right side buttons
                html += "<button class='btn btn-outline-primary me-2 btn-sm' onclick=\"openViewModal('<%= schemaName %>', '" + table.tableName + "', " + JSON.stringify(table.columns).replace(/"/g, "&quot;") + ")\"><img src='${pageContext.request.contextPath}/resources/images/search.png' style='max-width: 20px; margin-right: 5px;' alt='View Icon'>view</button>";
                html += "<button class='btn btn-outline-primary me-2 btn-sm' onclick='openAddModal()'><img src='${pageContext.request.contextPath}/resources/images/add.png' style='max-width: 20px; margin-right: 5px;' alt='Add Icon'>Add</button>";
                html += "<button class='btn btn-outline-primary me-2 btn-sm' onclick='openUpdateModal()'><img src='${pageContext.request.contextPath}/resources/images/update.png' style='max-width: 20px; margin-right: 5px;' alt='update Icon'>Update</button>";
                html += "<button class='btn btn-outline-primary me-2 btn-sm' onclick='openDeleteModal()'><img src='${pageContext.request.contextPath}/resources/images/delete.png' style='max-width: 20px; margin-right: 5px;' alt='delete Icon'>Delete Data</button>";
                html += "<button class='btn btn-danger btn-sm' onclick='openDeleteTableModal()'><img src='${pageContext.request.contextPath}/resources/images/delete2.png' style='max-width: 20px; margin-right: 5px;' alt='delete2 Icon'>Delete Table</button>";
                html += "</div>";
                html += "</div>";
                html += "<div class='card-body'>";

                html += "<table class='table table-striped table-bordered'>";
                html += "<thead><tr><th>Column Name</th><th>Column Type</th><th>Column Size</th></tr></thead>";
                html += "<tbody>";
                for (var j = 0; j < table.columns.length; j++) {
                    var column = table.columns[j];
                    html += "<tr>";
                    html += "<td class='col-6'>" + column.columnName + "</td>";
                    html += "<td class='col-3'>" + column.columnType + "</td>";
                    html += "<td class='col-3'>" + column.columnSize + "</td>";
                    html += "</tr>";
                }
                html += "</tbody></table>";
                html += "</div></div>";
                tablesList.append(html);
            }

            // Add event listener for search input
            $("#searchInput").on("input", function() {
                var searchText = $(this).val().toLowerCase();
                var visibleTables = 0;
                $("#tablesList .card").each(function() {
                    var tableName = $(this).find(".card-header span").text().toLowerCase();
                    if (tableName.includes(searchText)) {
                        $(this).show();
                        visibleTables++;
                    } else {
                        $(this).hide();
                    }
                });
                // Show "No tables found" message if no tables are visible
                var alertMessage = "<div id='noTablesAlert' class='alert alert-danger' role='alert'>No tables found!</div>";
                if (visibleTables === 0 && !$("#noTablesAlert").length) {
                    $("#tablesList").append(alertMessage);
                } else {
                    $("#noTablesAlert").remove(); // Remove the alert if tables are found
                }
            });
        } else {
            // If status is false or data is empty, display a message
            var message = "<BR><BR><BR><div class='alert alert-danger' role='alert'>No tables found!</div>";
            $("#tablesList").html(message);
        }
    }).fail(function() {
        // If AJAX call fails, display an error message
        var errorMessage = "<div class='alert alert-danger' role='alert'>Error fetching data. Please try again later.</div>";
        $("#tablesList").html(errorMessage);
    });
});



</script>




<%
    } catch (Exception e) {
        // Handle exceptions (e.g., logging, redirecting to an error page)
        System.out.println(e);
        e.printStackTrace(System.out);
        //e.printStackTrace();
    }
%>

</body>
</html>
