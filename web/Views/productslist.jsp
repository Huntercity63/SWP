<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Product List</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <!-- Material Icons -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons+Outlined" rel="stylesheet">
        <link rel="stylesheet" href="./mktcss/styles.css">
        <link rel="stylesheet" href="/qcss/style.css">
        <style>
            td img {
                width: 100px; /* Sets the width of the image */
                height: auto; /* Maintains the aspect ratio */
                border: 2px solid #ccc; /* Adds a border around the image */
                border-radius: 5px; /* Rounds the corners of the image */
                padding: 5px; /* Adds padding inside the border */
                box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3); /* Adds a shadow effect */
            }
            body {
                color: #566787;
                background: #f5f5f5;
                font-family: 'Varela Round', sans-serif;
                font-size: 13px;
            }
            .table-responsive {
                margin: 30px 0;
            }
            .table-wrapper {
                background: #fff;
                padding: 20px 25px;
                border-radius: 3px;
                min-width: 1000px;
                box-shadow: 0 1px 1px rgba(0,0,0,.05);
            }
            .table-title {
                padding-bottom: 15px;
                background: #435d7d;
                color: #fff;
                padding: 16px 30px;
                min-width: 100%;
                margin: -20px -25px 10px;
                border-radius: 3px 3px 0 0;
            }
            .table-title h2 {
                margin: 5px 0 0;
                font-size: 24px;
            }
            .table-title .btn-group {
                float: right;
            }
            .table-title .btn {
                color: #fff;
                float: right;
                font-size: 13px;
                border: none;
                min-width: 50px;
                border-radius: 2px;
                border: none;
                outline: none !important;
                margin-left: 10px;
            }
            .table-title .btn i {
                float: left;
                font-size: 21px;
                margin-right: 5px;
            }
            .table-title .btn span {
                float: left;
                margin-top: 2px;
            }
            table.table tr th, table.table tr td {
                border-color: #e9e9e9;
                padding: 12px 15px;
                vertical-align: middle;
            }
            table.table tr th:first-child {
                width: 60px;
            }
            table.table tr th:last-child {
                width: 100px;
            }
            table.table-striped tbody tr:nth-of-type(odd) {
                background-color: #fcfcfc;
            }
            table.table-striped.table-hover tbody tr:hover {
                background: #f5f5f5;
            }
            table.table th i {
                font-size: 13px;
                margin: 0 5px;
                cursor: pointer;
            }
            table.table td:last-child i {
                opacity: 0.9;
                font-size: 22px;
                margin: 0 5px;
            }
            table.table td a {
                font-weight: bold;
                color: #566787;
                display: inline-block;
                text-decoration: none;
                outline: none !important;
            }
            table.table td a:hover {
                color: #2196F3;
            }
            table.table td a.edit {
                color: #FFC107;
            }
            table.table td a.delete {
                color: #F44336;
            }
            table.table td i {
                font-size: 19px;
            }
            table.table .avatar {
                border-radius: 50%;
                vertical-align: middle;
                margin-right: 10px;
            }
            .pagination {
                display: inline-block;
            }
            .pagination  a {
                color: black;
                font-size: 22px;
                float: left;
                padding: 8px 16px;
                text-decoration: none;
            }
            .pagination a.active {
                background-color: #4CAF50;
                color: white;
            }
            .pagination a:hover:not(.active) {
                background: #27A4F2;
            }
            .hint-text {
                float: left;
                margin-top: 10px;
                font-size: 13px;
            }
            /* Custom checkbox */
            .custom-checkbox {
                position: relative;
            }
            .custom-checkbox input[type="checkbox"] {
                opacity: 0;
                position: absolute;
                margin: 5px 0 0 3px;
                z-index: 9;
            }
            .custom-checkbox label:before{
                width: 18px;
                height: 18px;
            }
            .custom-checkbox label:before {
                content: '';
                margin-right: 10px;
                display: inline-block;
                vertical-align: text-top;
                background: white;
                border: 1px solid #bbb;
                border-radius: 2px;
                box-sizing: border-box;
                z-index: 2;
            }
            .custom-checkbox input[type="checkbox"]:checked + label:after {
                content: '';
                position: absolute;
                left: 6px;
                top: 3px;
                width: 6px;
                height: 11px;
                border: solid #000;
                border-width: 0 3px 3px 0;
                transform: inherit;
                z-index: 3;
                transform: rotateZ(45deg);
            }
            .custom-checkbox input[type="checkbox"]:checked + label:before {
                border-color: #03A9F4;
                background: #03A9F4;
            }
            .custom-checkbox input[type="checkbox"]:checked + label:after {
                border-color: #fff;
            }
            .custom-checkbox input[type="checkbox"]:disabled + label:before {
                color: #b8b8b8;
                cursor: auto;
                box-shadow: none;
                background: #ddd;
            }
            /* Modal styles */
            .modal .modal-dialog {
                max-width: 400px;
            }
            .modal .modal-header, .modal .modal-body, .modal .modal-footer {
                padding: 20px 30px;
            }
            .modal .modal-content {
                border-radius: 3px;
                font-size: 14px;
            }
            .modal .modal-footer {
                background: #ecf0f1;
                border-radius: 0 0 3px 3px;
            }
            .modal .modal-title {
                display: inline-block;
            }
            .modal .form-control {
                border-radius: 2px;
                box-shadow: none;
                border-color: #dddddd;
            }
            .modal textarea.form-control {
                resize: vertical;
            }
            .modal .btn {
                border-radius: 2px;
                min-width: 100px;
            }
            .modal form label {
                font-weight: normal;
            }
        </style>
        <script>
            $(document).ready(function () {
                // Activate tooltip
                $('[data-toggle="tooltip"]').tooltip();

                // Select/Deselect checkboxes
                var checkbox = $('table tbody input[type="checkbox"]');
                $("#selectAll").click(function () {
                    if (this.checked) {
                        checkbox.each(function () {
                            this.checked = true;
                        });
                    } else {
                        checkbox.each(function () {
                            this.checked = false;
                        });
                    }
                });
                checkbox.click(function () {
                    if (!this.checked) {
                        $("#selectAll").prop("checked", false);
                    }
                });
            });

        </script>
    </head>
    <body>
        <div class="grid-container">

            <!-- Header -->
            <jsp:include page="header.jsp"></jsp:include>
                <!-- End Header -->

                <!-- Sidebar -->
            <jsp:include page="sidebar.jsp"></jsp:include>

                <div class="container-xl">
                    <div class="table-responsive">
                        <div class="table-wrapper">
                            <div class="table-title">
                                <div class="row">
                                    <div class="col-sm-3">
                                        <a href="productslist" style="color: white"><h2>Manage <b>Products</b></h2></a>
                                    </div>
                                <c:if test="${not empty msg}">
                                    <div style="color: white">${msg}</div>
                                </c:if>
                                <c:if test="${not empty msgUpdate}">
                                    <div style="color: white">${msgUpdate}</div>
                                </c:if>

                                <div style="text-align: right" class="col-sm-3">
                                    <form action="productslist" method="post">
                                        <input type="text" name="title" placeholder="Title or brief_information"><!-- comment -->
                                        <input type="submit" name="submit" value="Search"><!-- comment -->
                                        <input type="hidden" name="service" value="search">                                                                      
                                    </form>                    
                                </div>

                                <div class="col-sm-6">
                                    <a href="#Filter" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#XE15C;</i> <span>Filter</span></a>   
                                    <a href="#Sort" class="btn btn-danger" data-toggle="modal"><i class="material-icons">&#xe164;</i> <span>Sort</span></a>
                                    <a href="addp" class="btn btn-success"><i class="material-icons">&#xE147;</i> <span>Add new Product</span></a>
                                </div>
                            </div>
                        </div>
                        <table class="table table-striped table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Title</th>
                                    <th>Thumbnail</th>
                                    <th>Price</th>
                                    <th>Sale Price</th>
                                    <th>Featured</th>
                                    <th>Status</th>
                                    <th class="actions">Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${list}" var="product" >

                                    <tr>                                  
                                        <td>${product.productID}</td>
                                        <td>${product.product_name}</td>
                                        <td><img src="${product.thumbnail}" class="img"></td>
                                        <td>${product.original_price}</td>
                                        <td>${product.sale_price}</td>
                                        <td>${product.featured == 1 ? 'Yes' : 'No'}</td>
                                        <td>${product.status ? 'Show' : 'Hide'}</td>
                                        <td class="actions">
                                            <c:if test="${product.status == true}">
                                                <a title="Hide" onclick="location.href = 'update?action=hide&id=${product.productID}'"><i class="fas fa-eye-slash"></i></a>
                                                </c:if>
                                                <c:if test="${product.status == false}">
                                                <a title="Show" onclick="location.href = 'update?action=show&id=${product.productID}'"><i class="fas fa-eye"></i></a>
                                                </c:if>

                                            <a title="View" onclick="location.href = 'view?vid=${product.productID}'"><i class="fas fa-search"></i></a>
                                            <a title="Edit" onclick="location.href = 'editp?eid=${product.productID}'"><i class="fas fa-edit"></i></a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>        
                </div>
                <!-- Filter Modal HTML -->
                <div id="Filter" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Filter</h5>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <form action="productslist" method="post">
                                <div class="modal-body">
                                    <!-- Category Filter -->
                                    <div class="form-group">
                                        <label for="category-select">Category:</label>
                                        <select id="category-select" class="form-control" name="category">
                                            <option value="3">ALL</option>                                        
                                            <c:forEach items="${requestScope.category}" var="c">
                                                <option value="${c}">${c}</option>
                                            </c:forEach>
                                        </select>
                                    </div>                                
                                    <!-- Status Filter -->
                                    <div class="form-group">
                                        <label for="status-select">Status:</label>
                                        <select id="status-select" class="form-control" name="status">
                                            <option value="3">ALL</option>                                       
                                            <c:forEach items="${requestScope.status}" var="s">
                                                <option value="${s}">${s}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary">OK</button>
                                    <input type="hidden" name="service" value="filter">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- Sort Modal HTML -->
                <div id="Sort" class="modal fade">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Sort By</h5>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                            <form action="productslist" method="post">
                                <div class="modal-body">
                                    <!-- Sort Options -->
                                    <div class="form-group">
                                        <label for="sort-select">Sort By:</label>
                                        <select id="sort-select" class="form-control" name="sort">
                                            <option value="title">Title</option>
                                            <option value="category">Category</option>
                                            <option value="price">List Price</option>
                                            <option value="saleprice">Sale Price</option>
                                            <option value="featured">Featured</option>
                                            <option value="status">Status</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="submit" class="btn btn-primary">Sort</button>
                                    <input type="hidden" name="service" value="sort">
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <c:set var="page" value="${requestScope.page}"/> 
                <div class="pagination">
                    <c:forEach begin="${1}" end ="${requestScope.number}" var="i">
                        <a class="${i==page?"active":""}" href="productslist?page=${i}">${i}</a>
                    </c:forEach>
                </div> 
            </div>
        </div>    
    </body>
</html>
