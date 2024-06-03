<%-- 
    Document   : viewProduct
    Created on : May 24, 2024, 12:00:21 AM
    Author     : MANH VINH
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Product Details</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            td img {
                width: 100px; /* Sets the width of the image */
                height: auto; /* Maintains the aspect ratio */
                border: 2px solid #ccc; /* Adds a border around the image */
                border-radius: 5px; /* Rounds the corners of the image */
                padding: 5px; /* Adds padding inside the border */
                box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3); /* Adds a shadow effect */
            }
            /* CSS for viewProduct.jsp */
            .thumbnail img {
                max-width: 100%; /* Ảnh sẽ tự động thay đổi kích thước sao cho phù hợp với độ rộng của phần tử cha */
                height: auto; /* Duy trì tỷ lệ khung hình */
            }

            body {
                color: #566787;
                background: #f5f5f5;
                font-family: 'Varela Round', sans-serif;
                font-size: 16px;
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
            /* Custom styles for Edit button */
            .btn-edit {
                background-color: #28a745;
                border-color: #28a745;
                color: white;
            }
            .btn-edit:hover {
                background-color: #218838;
                border-color: #1e7e34;
            }
              .flag-container {
                position: relative;
                display: inline-block;
            }
            .flag-container .fa-flag {
                color: #435d7d;
            }
            .flag-container .fa-ban {
                position: absolute;
                top: 0;
                left: 0;
                color: red;
                font-size: 1.2em;
        </style>
        <script>
            $(document).ready(function () {
                // Edit button click event
                $(document).on("click", ".edit", function () {
                    var productId = "${product.productID}";
                    var productName = "${product.product_name}";
                    var productThumbnail = "${product.thumbnail}";
                    var productPrice = "${product.original_price}";
                    var productCategory = "${product.categoryProduct.category_name}";
                    var briefInformation = "${product.brief_information}";
                    var attachedImages = "${product.categoryProduct.image}";
                    var productDescription = "${product.product_description}";
                    var quantity = "${product.quantity}";
                    var salePrice = "${product.sale_price}";
                    var featured = "${product.featured}";
                    var status = "${product.status}";

                    $("#editProductModal #productId").val(productId);
                    $("#editProductModal #productName").val(productName);
                    $("#editProductModal #productThumbnail").val(productThumbnail);
                    $("#editProductModal #productPrice").val(productPrice);
                    $("#editProductModal #productCategory").val(productCategory);
                    $("#editProductModal #briefInformation").val(briefInformation);
                    $("#editProductModal #attachedImages").val(attachedImages);
                    $("#editProductModal #productDescription").val(productDescription);
                    $("#editProductModal #quantity").val(quantity);
                    $("#editProductModal #salePrice").val(salePrice);
                    $("#editProductModal #featured").val(featured);
                    $("#editProductModal #status").val(status);

                    $("#editProductModal").modal("show");
                });

                // Save changes button click event
                $("#saveChangesBtn").click(function () {
                    var productId = $("#editProductModal #productId").val();
                    var productName = $("#editProductModal #productName").val();
                    var productThumbnail = $("#editProductModal #productThumbnail").val();
                    var productPrice = $("#editProductModal #productPrice").val();
                    var productCategory = $("#editProductModal #productCategory").val();
                    var briefInformation = $("#editProductModal #briefInformation").val();
                    var attachedImages = $("#editProductModal #attachedImages").val();
                    var productDescription = $("#editProductModal #productDescription").val();
                    var quantity = $("#editProductModal #quantity").val();
                    var salePrice = $("#editProductModal #salePrice").val();
                    var featured = $("#editProductModal #featured").val();
                    var status = $("#editProductModal #status").val();

                    // Use AJAX to update the product information
                    $.ajax({
                        url: "editProductDetails",
                        type: "POST",
                        data: {
                            id: productId,
                            name: productName,
                            thumbnail: productThumbnail,
                            price: productPrice,
                            category: productCategory,
                            briefInformation: briefInformation,
                            attachedImages: attachedImages,
                            description: productDescription,
                            quantity: quantity,
                            salePrice: salePrice,
                            featured: featured,
                            status: status
                        },
                        success: function (response) {
                            // Handle success response
                            location.reload(); // Reload the page to reflect the changes
                        },
                        error: function (xhr, status, error) {
                            // Handle error response
                            alert("An error occurred while updating the product.");
                        }
                    });
                });
            });
        </script>
    </head>
    <body>
        <div class="container-xl">
            <div class="table-responsive">
                <div class="table-wrapper">
                    <div class="table-title">
                        <div class="row">
                            <div  class="col-sm-3">
                                <a href="productslist" style="color: white"><h2>Product <b>Details</b></h2></a>
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-hover">
                        <thead>
                            <tr>
                                <th>Attributes</th>
                                <th>Values</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test="${not empty product}">
                                <tr>
                                    <td>Thumbnail:</td>
                                    <td><img src="${product.thumbnail}" alt="Thumbnail" class="thumbnail"></td>
                                </tr>
                                <tr>
                                    <td>Category Product:</td>
                                    <td>${product.categoryProduct.category_name}</td>                                    
                                </tr>
                                <tr>
                                    <td>Title:</td>
                                    <td>${product.product_name}</td>
                                </tr>
                                <tr>
                                    <td>Brief Information:</td>
                                    <td>${product.brief_information}</td>
                                </tr>
                                <tr>
                                    <td>Attached images:</td>
                                    <td>${product.categoryProduct.image}</td>
                                </tr>
                                <tr>
                                    <td>Product Description:</td>
                                    <td>${product.product_description}</td>
                                </tr>
                                <tr>
                                    <td>Quantity:</td>
                                    <td>${product.quantity}</td>
                                </tr>
                                <tr>
                                    <td>Original Price:</td>
                                    <td>${product.original_price}</td>
                                </tr>
                                <tr>
                                    <td>Sale Price:</td>
                                    <td>${product.sale_price}</td>
                                </tr>
                                <tr>
                                    <td>Featured:</td>
                                    <td>
                                        ${product.featured == 1 ? "Yes" : "No"}
                                        <c:if test="${product.featured == 1}">
                                            <a title="Off" onclick="location.href = 'turnfeatured?action=off&id=${product.productID}'"><i class="fas fa-flag-checkered"></i></a>
                                            </c:if>
                                            <c:if test="${product.featured == 0}">
                                            <a title="On" onclick="location.href = 'turnfeatured?action=on&id=${product.productID}'"><i class="fas fa-flag"></i></a>
                                            </c:if>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Status:</td>
                                    <td>${product.status ? "Show" : "Hide"}</td>
                                </tr>
                                <tr>
                                    <td colspan="3" class="text-right">
                                        <button type="button" class="btn btn-primary edit">
                                            <i class="fas fa-edit"></i> Edit
                                        </button>
                                    </td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

        <!-- Edit Product Modal -->
        <div id="editProductModal" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form id="editProductForm">
                        <div class="modal-header">
                            <h4 class="modal-title">Edit Product</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <input type="hidden" id="productId" name="id">
                            <div class="form-group">
                                <label>Product Name</label>
                                <input type="text" id="productName" name="name" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Thumbnail</label>
                                <input type="text" id="productThumbnail" name="thumbnail" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Price</label>
                                <input type="number" id="productPrice" name="price" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Category</label>
                                <input type="text" id="productCategory" name="category" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Brief Information</label>
                                <input type="text" id="briefInformation" name="briefInformation" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Attached Images</label>
                                <input type="text" id="attachedImages" name="attachedImages" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Description</label>
                                <textarea id="productDescription" name="description" class="form-control" required></textarea>
                            </div>
                            <div class="form-group">
                                <label>Quantity</label>
                                <input type="number" id="quantity" name="quantity" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Sale Price</label>
                                <input type="number" id="salePrice" name="salePrice" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Featured</label>
                                <select id="featured" name="featured" class="form-control" required>
                                    <option value="0">No</option>
                                    <option value="1">Yes</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>Status</label>
                                <select id="status" name="status" class="form-control" required>
                                    <option value="0">Hide</option>
                                    <option value="1">Show</option>
                                </select>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                            <input type="button" id="saveChangesBtn" class="btn btn-success" value="Save">
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
