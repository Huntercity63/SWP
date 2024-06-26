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


            /* Định dạng cho các nhãn chứa radio buttons */
            .selectAddress label {
                display: flex;
                align-items: center; /* Căn giữa theo trục dọc */
                margin-bottom: 1rem; /* Khoảng cách dưới */
                cursor: pointer; /* Con trỏ dạng bàn tay */
                border: 1px solid #ddd; /* Đường viền */
                border-radius: 5px; /* Bo tròn góc */
                padding: 0.5rem; /* Padding xung quanh */
                background-color: #fff; /* Màu nền */
                transition: background-color 0.3s;
                width: 10%; /* Hiệu ứng chuyển màu nền */
            }

            /* Định dạng cho các radio buttons */
            .addressCheckbox {
                margin-right: 0.5rem; /* Khoảng cách bên phải */
            }

            /* Định dạng cho nhãn chứa tên người nhận */
            .selectAddress label span {
                font-size: 1rem; /* Kích thước font */
                color: #333; /* Màu chữ */
            }

            /* Định dạng khi hover và chọn */
            .selectAddress label:hover {
                background-color: #f0f0f0; /* Màu nền khi hover */
            }

            .selectAddress input[type="radio"]:checked + span {
                background-color: #e0e0e0; /* Màu nền khi được chọn */
                padding: 0.5rem;
                border-radius: 5px;
            }

            /* Định dạng cho các thành phần ẩn */
            input[type="hidden"] {
                display: none;
            }



        </style>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script>
            function showForm() {
                document.getElementById("selectAddressForm").style.display = "block";
            }

            function hideForm() {
                document.getElementById("selectAddressForm").style.display = "none";
            }
        </script>
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
                <h1 class="font-weight-semi-bold text-uppercase mb-3">Checkout</h1>
                <div class="d-inline-flex">
                    <p class="m-0"><a href="">Home</a></p>
                    <p class="m-0 px-2">-</p>
                    <p class="m-0">Checkout</p>
                </div>
            </div>
        </div>
        <!-- Page Header End -->


        <!-- Checkout Start -->
        <div class="container-fluid pt-5">
            <div class="col-lg-12 selectAddress">


            </div>
            <div class="row px-xl-5">
                <div class="col-lg-7">  
                    <div class="mb-4">
                        <h4 class="font-weight-semi-bold mb-4">Shipping Address</h4> 
                        <a href="#Add" class="btn btn-success" data-toggle="modal"><i class="material-icons">&#xE147;</i> <span>Change</span></a>
                        <form action="CartContact" method="post">
                            <c:set value="${info}" var="cus1"></c:set>
                                <div id="ListPro"></div>
                                <input type="hidden" name="recieverid" value="${cus1.getReceiverID()}">
                            <div class="row">
                                <div class="col-md-6 form-group">
                                    <label>Full Name</label>
                                    <input class="form-control" type="text" value="${cus1.getReceiverFullName()}" readonly="">
                                </div>   
                                <div class="col-md-6 form-group">
                                    <label>Gender</label>
                                    <c:choose>
                                        <c:when test="${cus1.customer.gender == true}">
                                            <input class="form-control" type="text" value="Female" readonly>
                                        </c:when>
                                        <c:otherwise>
                                            <input class="form-control" type="text" value="Male" readonly>
                                        </c:otherwise>
                                    </c:choose>

                                </div>
                                <div class="col-md-6 form-group">
                                    <label>E-mail</label>
                                    <input class="form-control" type="text" value="${cus1.customer.email}" readonly="">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Mobile No</label>
                                    <input class="form-control" type="text" value="${cus1.getReceiverMobile()}" readonly="">
                                </div>
                                <div class="col-md-6 form-group">
                                    <label>Address</label>
                                    <input class="form-control" type="text" value="${cus1.getReceiverAddress()}" readonly="">
                                </div>
                                <div class="col-md-12 form-group">
                                    <label>Notes</label>
                                    <textarea class="form-control" name="notes" style="width: 100%; max-width: 1000px; height: 150px; padding: 10px; border: 1px solid #ccc; border-radius: 4px; box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075); font-size: 16px; line-height: 1.5; color: #555; background-color: #fff; transition: border-color 0.3s ease-in-out, box-shadow 0.3s ease-in-out;"></textarea>
                                </div>


                            </div>
                    </div>

                </div>
                <div class="col-lg-5">
                    <div class="card border-secondary mb-5">
                        <div class="card-header bg-secondary border-0">
                            <h4 class="font-weight-semi-bold m-0">Order Total</h4>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-6">
                                    <h6 class="font-weight-medium">Products</h6>
                                </div>
                                <div class="col-lg">
                                    <h6 class="font-weight-medium">Prices</h6>
                                </div>
                                <div class="col-lg">
                                    <h6 class="font-weight-medium">Quantity</h6>
                                </div>
                                <div class="col-lg">
                                    <h6 class="font-weight-medium">Cost</h6>
                                </div>
                            </div>

                            <c:forEach items="${requestScope.list}" var="l" varStatus="status">
                                <div class="row">
                                    <div class="col-lg-6">
                                        <input type="hidden" name="productID" value="${l.product.productID}" />
                                        <input type="hidden" name="productName" value="${l.product.product_name}" />
                                        <p>${l.product.product_name}</p>
                                    </div>
                                    <div class="col-lg">
                                        <c:choose>
                                            <c:when test="${l.product.sale_price != 0}">
                                                <input type="hidden" name="productPrice" value="${l.product.sale_price}" />
                                                <p class="align-middle">${l.product.sale_price}</p>
                                            </c:when>
                                            <c:otherwise>
                                                <input type="hidden" name="productPrice" value="${l.product.original_price}" />
                                                <p class="align-middle">${l.product.original_price}</p>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                    <div class="col-lg">
                                        <input type="hidden" name="productQuantity" value="${l.quantity}" />
                                        <p>${l.quantity}</p>
                                    </div>
                                    <div class="col-lg">
                                        <input type="hidden" name="productCost" value="${l.product.sale_price != 0 ? l.product.sale_price * l.quantity : l.product.original_price * l.quantity}" />
                                        <p>${l.product.sale_price != 0 ? l.product.sale_price * l.quantity : l.product.original_price * l.quantity}</p>
                                    </div>
                                </div>
                                <c:set var="itemPrice" value="${l.product.sale_price != 0 ? l.product.sale_price : l.product.original_price}" />
                                <c:set var="subtotal" value="${itemPrice * l.quantity}" />
                                <c:set var="totalOrderPrice" value="${totalOrderPrice + subtotal}" />

                            </c:forEach>


                        </div>
                        <div class="card-footer border-secondary bg-transparent">
                            <div class="d-flex justify-content-between mt-2">
                                <h5 class="font-weight-bold">Total</h5>
                                <h5 class="font-weight-bold">$${totalOrderPrice}</h5>
                                <input type="hidden" name ="total" value="${totalOrderPrice}">
                            </div>
                        </div>
                    </div>
                    <div class="card border-secondary mb-5">
                        <div class="card-header bg-secondary border-0">
                            <h4 class="font-weight-semi-bold m-0">Payment</h4>
                        </div>
                        <div class="card-body">                          
                            <div class="form-group">
                                <div class="custom-control custom-radio">
                                    <input type="radio" class="custom-control-input" name="paymentMethod"  value="delivery" id="directcheck">
                                    <label class="custom-control-label" for="directcheck">Payment on delivery</label>
                                </div>
                            </div>
                            <div class="">
                                <div class="custom-control custom-radio">
                                    <input type="radio" class="custom-control-input" name="paymentMethod" value="vnpay" id="banktransfer">
                                    <label class="custom-control-label" for="banktransfer">VN Pay</label>
                                </div>
                            </div>
                        </div>
                        <div class="card-footer border-secondary bg-transparent">
                            <button type="submit"class="btn btn-lg btn-block btn-primary font-weight-bold my-3 py-3">Place Order</button>
                        </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>

        <div id="Add" class="modal fade">
            <div class="modal-dialog">
                <div class="modal-content">
                    <form action="CartContact" method="GET" enctype="multipart/form-data">
                        <div class="modal-header">						
                            <h4 class="modal-title">My Address</h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">					
                            <div class="form-group">
                                <c:forEach items="${requestScope.list1}" var="c" varStatus="status">
                                    <label>
                                        <input type="radio" id="address${status.index}" name="selectedAddress" value="${c.getReceiverID()}" class="addressCheckbox"
                                               ${c.getReceiverID() == requestScope.check ? 'checked' : ''} onchange="submitForm()">
                                        ${c.getReceiverFullName()}
                                    </label>
                                    <label> ${c.getReceiverMobile()} </label>
                                    <label>${c.getReceiverAddress()}</label>
                                     <hr>
                                    <br>
                                </c:forEach>                              
                                <c:forEach items="${requestScope.carItemIDs}" var="a">
                                    <input type="hidden" name="carItemIDs" value="${a}">
                                </c:forEach>
                                <c:forEach items="${requestScope.cartIDs}" var="b">
                                    <input type="hidden" name="cartIDs" value="${b}">
                                </c:forEach>
                            </div>                          
                        </div>
                        <div class="modal-footer">

                            <input type="submit" class="btn btn-info" value="OK">
                            <input type="hidden" name="service" value="add">
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!-- Checkout End -->


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
                                <!--                            <a class="text-dark mb-2" href="shop.html"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
                                                            <a class="text-dark mb-2" href="detail.html"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a>-->
                                <a class="text-dark mb-2" href="cart.html"><i class="fa fa-angle-right mr-2"></i>Shopping Cart</a>
                                <a class="text-dark mb-2" href="checkout.html"><i class="fa fa-angle-right mr-2"></i>Checkout</a>
                                <a class="text-dark" href="contact.html"><i class="fa fa-angle-right mr-2"></i>Contact Us</a>
                            </div>
                        </div>
                        <div class="col-md-4 mb-5">
                            <h5 class="font-weight-bold text-dark mb-4">Quick Links</h5>
                            <div class="d-flex flex-column justify-content-start">
                                <a class="text-dark mb-2" href="index.html"><i class="fa fa-angle-right mr-2"></i>Home</a>
                                <!--                            <a class="text-dark mb-2" href="shop.html"><i class="fa fa-angle-right mr-2"></i>Our Shop</a>
                                                            <a class="text-dark mb-2" href="detail.html"><i class="fa fa-angle-right mr-2"></i>Shop Detail</a>-->
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
                                                   };
        </script>
        <script>
            function submitForm() {
                document.getElementById("selectAddressForm").submit();
            }
        </script>
        <!-- Template Javascript -->
        <script src="js/main.js"></script>
    </body>

</html>