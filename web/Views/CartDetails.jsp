<%-- 
    Document   : CartDetails
    Created on : Jun 3, 2024, 1:01:21 AM
    Author     : phuan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>EShopper - Bootstrap Shop Template</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="Free HTML Templates" name="keywords">
        <meta content="Free HTML Templates" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet"> 

        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <style>
            .button {
                display: inline-block;
                padding: 10px 20px;
                font-size: 16px;
                text-align: center;
                text-decoration: none;
                color: white;
                background-color: #BCC6FF;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
        </style>
        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/style.css" rel="stylesheet">
    </head>

    <body>
        <!-- Topbar Start -->
        <div class="row align-items-center py-3 px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
                <a href="" class="text-decoration-none">
                    <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">E</span>Shopper</h1>
                </a>
            </div>
            <div class="col-lg-6 col-6 text-left">
                <form action="ProductsListPublic" method="get">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search for products" name = "search">
                        <div class="input-group-append">
                            <span class="input-group-text bg-transparent text-primary">
                                <i class="fa fa-search"></i>
                            </span>
                        </div>
                    </div>
                    <input type="hidden" name="service" value="search">
                </form>
            </div>
            <div class="col-lg-3 col-6 text-right">

                <a href="" class="btn border">
                    <i class="fas fa-shopping-cart text-primary"></i>
                    <span class="badge">${sessionScope.cart.size()}</span>
                </a>
            </div>
        </div>
        <!-- Topbar End -->

        <!-- Navbar Start -->
        <div class="container-fluid">
            <div class="row border-top px-xl-5">
                <div class="col-lg-3 d-none d-lg-block">
                    <a class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; margin-top: -1px; padding: 0 30px;">
                        <h6 class="m-0">Categories</h6>
                        <i class="fa fa-angle-down text-dark"></i>
                    </a>
                    <nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 1;">
                        <div class="navbar-nav w-100 overflow-hidden" style="height: 410px">
                            <c:forEach items="${requestScope.Cate1}" var="a"> 
                                <div class="nav-item dropdown"> 
                                    <a href="#" class="nav-link" data-toggle="dropdown">${a.category_name}<i class="fa fa-angle-down float-right mt-1"></i></a>
                                    <div class="dropdown-menu position-absolute bg-secondary border-0 rounded-0 w-100 m-0">
                                        <c:forEach items="${requestScope.CategoryB}" var="c"> 
                                            <c:if test="${a.getCategory_name() == c.categoryProduct.getCategory_name()}">

                                                <a href="ProductsListPublic?cid=${a.category_productID}" class="dropdown-item">${c.brand}</a>

                                            </c:if>
                                        </c:forEach>
                                    </div>
                                </div>
                            </c:forEach>                   
                        </div>
                    </nav>
                </div>
                <div class="col-lg-9">
                    <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                        <a href="" class="text-decoration-none d-block d-lg-none">
                            <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">E</span>Shopper</h1>
                        </a>
                        <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                        <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                            <div class="navbar-nav mr-auto py-0">
                                <a href="HomePage" class="nav-item nav-link">Home</a>
                                <a href="ProductsListPublic" class="nav-item nav-link">Shop</a>

                                <div class="nav-item dropdown">
                                    <a href="" class="nav-link dropdown-toggle" data-toggle="dropdown">Pages</a>
                                    <div class="dropdown-menu rounded-0 m-0">
                                        <a href="BlogController" class="dropdown-item">Lasted Post</a>
                                    </div>
                                </div>
                                <a href="contact.html" class="nav-item nav-link">Contact</a>
                            </div>
                            <c:set  value="${sessionScope.cus}" var="cus1"></c:set>
                            <c:choose>
                                <c:when test="${not empty sessionScope.cus}">

                                    <div class="navbar-nav ml-auto py-0">
                                        <a href=""style="margin-right: 10px">HI ${cus1.first_name} ${cus1.last_name}</a>
                                        <a href="LogOut">Log out</a>

                                    </div>

                                </c:when>
                                <c:otherwise>
                                    <div class="navbar-nav ml-auto py-0">
                                        <a href="LoginCusController" class="nav-item nav-link">Login</a>
                                        <a href="signup" class="nav-item nav-link">Register</a>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
        <!-- Navbar End -->


        <!-- Page Header Start -->
        <div class="container-fluid bg-secondary mb-5">
            <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
                <h1 class="font-weight-semi-bold text-uppercase mb-3">Shopping Cart</h1>
                <div class="d-inline-flex">
                    <p class="m-0"><a href="HomePage">Home</a></p>
                    <p class="m-0 px-2">-</p>
                    <p class="m-0">Shopping Cart</p>
                </div>
            </div>
        </div>
        <!-- Page Header End -->

        <button class="button" style="margin-left: 7%"onclick="location.href = 'ProductsListPublic'">More Product</button>
        <div id="ListPro"></div>
        <!-- Cart Start -->
        <div class="container-fluid pt-5">

            <div class="row px-xl-5">

                <div class="col-lg-8 table-responsive mb-5">
                    <table class="table table-bordered text-center mb-0">
                        <thead class="bg-secondary text-dark">
                            <tr>
                                <th></th>
                                <th>Products</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Available</th>
                                <th>Total</th>
                                <th>Remove</th>
                            </tr>
                        </thead>

                        <tbody class="align-middle">

                            <c:forEach items="${requestScope.list}" var="l" varStatus="status">
                                <tr>
                                    <td class="align-middle">
                                        <input type="checkbox" name="select-item" value="${l.getCarItemID()}" class="select-item" checked="">
                                        <input type="hidden" name="cartid" value="${l.cart.getCartID()}" class="cartid">
                                    </td>
                                    <td class="align-middle"><img src="${l.product.thumbnail}" alt="" style="width: 50px;">${l.product.product_name}</td>
                                        <c:choose>
                                            <c:when test="${l.product.sale_price != 0}">
                                            <td class="align-middle" id="price-${status.index}">${l.product.sale_price}</td>
                                        </c:when>
                                        <c:otherwise>
                                            <td class="align-middle" id="price-${status.index}">${l.product.original_price}</td>
                                        </c:otherwise>
                                    </c:choose>

                                    <c:forEach items="${requestScope.quantity}" var="q">
                                        <c:if test="${q.key == l.product.productID}">
                                            <td class="align-middle">
                                                <form class="quantityForm" action="CartDetails" method="post">
                                                    <input type="hidden" name="cartid" value="${l.cart.getCartID()}">
                                                    <input type="hidden" name="pid" value="${l.product.productID}">
                                                    <div class="input-group quantity mx-auto" style="width: 100px;">
                                                        <div class="input-group-btn">
                                                            <button class="btn btn-sm btn-primary btn-minus" data-index="${status.index}">
                                                                <i class="fa fa-minus"></i>
                                                            </button>
                                                        </div>
                                                        <input type="text" class="form-control form-control-sm bg-secondary text-center quantity-input" id="quantity-${status.index}" value="${l.quantity}" name ="quantity" max="${q.value}" min = "1">
                                                        <div class="input-group-btn">
                                                            <button class="btn btn-sm btn-primary btn-plus" data-index="${status.index}">
                                                                <i class="fa fa-plus"></i>
                                                            </button>

                                                        </div>
                                                    </div>
                                                </form>
                                            </td>                                

                                            <td class="align-middle">
                                                ${q.value}
                                            </td>
                                        </c:if>
                                    </c:forEach>
                                    <c:set var="itemPrice" value="${l.product.sale_price != 0 ? l.product.sale_price : l.product.original_price}" />
                                    <c:set var="subtotal" value="${itemPrice * l.quantity}" />
                                    <c:set var="totalOrderPrice" value="${totalOrderPrice + subtotal}" />
                                    <td class="align-middle" id="total-${status.index}">
                                        ${l.product.sale_price != 0 ? l.product.sale_price * l.quantity : l.product.original_price * l.quantity}
                                    </td>                              
                            <form action="CartDetails" method="post">

                                <td class="align-middle">
                                    <button class="btn btn-sm btn-primary" type="submit" name="delete" value="delete">
                                        <i class="fa fa-times"></i>
                                    </button>
                                </td>       
                                <input type="hidden" name="cartid" value="${l.cart.getCartID()}">
                                <input type="hidden" name="cartitemid" value="${l.getCarItemID()}">
                            </form>
                            </tr>

                        </c:forEach>

                        </tbody>
                    </table>
                </div>
                <div class="col-lg-4">

                    <div class="card border-secondary mb-5">
                        <div class="card-header bg-secondary border-0">
                            <h4 class="font-weight-semi-bold m-0">Cart Summary</h4>
                        </div>                    
                        <div class="card-footer border-secondary bg-transparent">
                            <div class="d-flex justify-content-between mt-2">
                                <h5 class="font-weight-bold">Total</h5>
                                <h5 class="font-weight-bold">$${totalOrderPrice}</h5>
                            </div>
                            <button class="btn btn-block btn-primary my-3 py-3" id="proceedToCheckout">Proceed To Checkout</button>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <!-- Cart End -->


        <!-- Footer Start -->
        <div class="container-fluid bg-secondary text-dark mt-5 pt-5">
            <div class="row px-xl-5 pt-5">
                <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
                    <a href="" class="text-decoration-none">
                        <h1 class="mb-4 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border border-white px-3 mr-1">E</span>Shopper</h1>
                    </a>
                    <p></p>
                    <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>Dong Hung,Thai Binh, Viet Nam</p>
                    <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>info@example.com</p>
                    <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>+012 345 67890</p>
                </div>
                <div class="col-lg-8 col-md-12">
                    <div class="row">
                        <div class="col-md-4 mb-5">
                            <h5 class="font-weight-bold text-dark mb-4">Quick Links</h5>
                            <div class="d-flex flex-column justify-content-start">
                                <a class="text-dark mb-2" href="index.html"><i class="fa fa-angle-right mr-2"></i>Home</a>

                                <a class="text-dark mb-2" href="cart.html"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                                <a class="text-dark mb-2" href="checkout.html"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                                <a class="text-dark" href="contact.html"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                            </div>
                        </div>
                        <div class="col-md-4 mb-5">
                            <h5 class="font-weight-bold text-dark mb-4">Quick Links</h5>
                            <div class="d-flex flex-column justify-content-start">
                                <a class="text-dark mb-2" href="index.html"><i class="fa fa-angle-right mr-2"></i>Home</a>

                                <a class="text-dark mb-2" href="cart.html"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                                <a class="text-dark mb-2" href="checkout.html"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                                <a class="text-dark" href="contact.html"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                            </div>
                        </div>
                        <div class="col-md-4 mb-5">
                            <h5 class="font-weight-bold text-dark mb-4">Newsletter</h5>

                            <div><p>HKD Nguyen Phu Anh </p>
                                <p> Giấy chứng nhận đăng ký HKD số 17A80041952 do Phòng Tài chính - Kế hoạch, Uỷ ban nhân dân thành phố Thái Nguyên cấp ngày 30/5/2019</p>
                                <p> Địa chỉ: Số 235, Đường Quang Trung, Tổ 7, Phường Tân Thịnh, Thành phố Thái Nguyên, Tỉnh Thái Nguyên, Việt Nam</p>
                                <p> Email: teelabvn@gmail.com</p>
                                <p>Điện thoại: 0865539083</p></div>
                        </div>      
                    </div>
                </div>
            </div>
            <div class="row border-top border-light mx-xl-5 py-4">
                <div class="col-md-6 px-xl-0">
                    <p class="mb-md-0 text-center text-md-left text-dark">
                        &copy; <a class="text-dark font-weight-semi-bold" href="#">Your Site Name</a>. All Rights Reserved. Designed
                        by
                        <a class="text-dark font-weight-semi-bold" href="https://htmlcodex.com">HTML Codex</a>
                    </p>
                </div>
                <div class="col-md-6 px-xl-0 text-center text-md-right">
                    <img class="img-fluid" src="img/payments.png" alt="">
                </div>
            </div>
        </div>
        <!-- Footer End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
        <script src="lib/easing/easing.min.js"></script>
        <script src="lib/owlcarousel/owl.carousel.min.js"></script>

        <!-- Contact Javascript File -->
        <script src="mail/jqBootstrapValidation.min.js"></script>
        <script src="mail/contact.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        <!--        <script>
        
                    $(document).ready(function () {
                        $(".quantityForm").submit(function (event) {
                            // Prevent the form from being submitted in the usual way
                            event.preventDefault();
        
                            // Get the data from the form
                            var formData = $(this).serialize();
        
                            // Send the data using AJAX
                            $.ajax({
                                url: "CartDetails", // The path to the server that will handle the form
                                type: "POST",
                                data: formData,
                                success: function (response) {
                                    // Handle the server's response (if necessary)
                                    console.log("Form submitted successfully!");
        
                                    // Update the quantity and total on the page
                                    var quantityInput = $(event.target).find(".quantity-input");
                                    var totalElement = $("#total-" + quantityInput.attr("id").split("-")[1]);
                                    var priceElement = $("#price-" + quantityInput.attr("id").split("-")[1]);
                                    var quantity = parseInt(quantityInput.val());
                                    var price = parseFloat(priceElement.text());
                                    var total = price * quantity;
                                    totalElement.text(total);
        
                                    // Update the total price displayed on the page
                                    var totalPrice = 0;
                                    $("td[id^='total-']").each(function () {
                                        totalPrice += parseFloat($(this).text());
                                    });
                                    $(".card-footer .d-flex .font-weight-bold").last().text("$" + totalPrice.toFixed(2));
                                },
                                error: function () {
                                    console.error("Error when submitting the form!");
                                }
                            });
                        });
                    });
        
        
                </script>-->
        <script>
          $(document).ready(function () {
              $(".quantityForm").submit(function (event) {
                  // Prevent the form from being submitted in the usual way
                  event.preventDefault();

                  // Get the quantity input and its max value
                  var quantityInput = $(this).find(".quantity-input");
                  var quantity = parseInt(quantityInput.val());
                  var max = parseInt(quantityInput.attr("max"));
                  var min = parseInt(quantityInput.attr("min"));

                  // Validate the quantity
                  if (quantity > max) {
                      quantityInput.val(max);
                      quantity = max;
                  } else if (quantity < min) {
                      quantityInput.val(min);
                      quantity = min;
                  }

                  // Get the data from the form
                  var formData = $(this).serialize();

                  // Send the data using AJAX
                  $.ajax({
                      url: "CartDetails", // The path to the server that will handle the form
                      type: "POST",
                      data: formData,
                      success: function (response) {
                          // Handle the server's response (if necessary)
                          console.log("Form submitted successfully!");

                          // Update the quantity and total on the page
                          var totalElement = $("#total-" + quantityInput.attr("id").split("-")[1]);
                          var priceElement = $("#price-" + quantityInput.attr("id").split("-")[1]);
                          var price = parseFloat(priceElement.text());
                          var total = price * quantity;
                          totalElement.text(total.toFixed(2));

                          // Update the total price displayed on the page
                          var totalPrice = 0;
                          $("td[id^='total-']").each(function () {
                              totalPrice += parseFloat($(this).text());
                          });
                          $(".card-footer .d-flex .font-weight-bold").last().text("$" + totalPrice.toFixed(2));
                      },
                      error: function () {
                          console.error("Error when submitting the form!");
                      }
                  });
              });
          });
        </script>

        <script>
            document.getElementById("proceedToCheckout").addEventListener("click", function () {
                // Lấy tất cả các phần tử input có name là "select-item"
                var carItemIDs = [];
                var cartIDs = [];
                var checkboxes = document.querySelectorAll('input[name="select-item"]');
                checkboxes.forEach(function (checkbox) {
                    if (checkbox.checked) {
                        var carItemID = checkbox.value;
                        var cartID = checkbox.nextElementSibling.value;
                        carItemIDs.push(carItemID);
                        cartIDs.push(cartID);
                    }
                });
                var url = "CartContact?carItemIDs=" + encodeURIComponent(carItemIDs.join(',')) + "&cartIDs=" + encodeURIComponent(cartIDs.join(','));
                window.location.href = url;
            });
        </script>

        <script type="text/javascript">
            window.onload = function () {
            <c:if test="${not empty requestScope.scroll}">
                var searchboxElement = document.getElementById("ListPro");
                if (searchboxElement) {
                    searchboxElement.scrollIntoView({
                        behavior: 'smooth', // Thêm thuộc tính behavior để làm mềm cuộn
                        block: 'start' // Chỉ định vị trí cuộn tới của phần tử
                    });
                }
            </c:if>
            }
            ;
        </script>





    </body>

</html>