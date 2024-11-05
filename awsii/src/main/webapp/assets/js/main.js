$( function() {

    var wind = $(window);

    wow = new WOW({
        boxClass: 'wow',
        animateClass: 'animated',
        offset: 200,
        mobile: false,
        live: false
    });
    wow.init();

    // scrollIt
    $.scrollIt({
        upKey: 38,                // key code to navigate to the next section
        downKey: 40,              // key code to navigate to the previous section
        easing: 'linear',         // the easing function for animation
        scrollTime: 700,          // how long (in ms) the animation takes
        activeClass: 'active',    // class given to the active nav element
        onPageChange: null,       // function(pageIndex) that is called when page is changed
        topOffset: -100            // offste (in px) for fixed top navigation
      });


    // ---------- nav scroll -----------
    wind.on("scroll", function() {

        var bodyScroll = wind.scrollTop(),
            navbar = $(".navbar")

        if (bodyScroll > 200) {

            navbar.addClass("nav-scroll");

        } else {

            navbar.removeClass("nav-scroll");
        }
    });
    

    // ---------- to top -----------
    wind.on("scroll", function() {

        var bodyScroll = wind.scrollTop(),
            toTop = $(".to_top")

        if (bodyScroll > 700) {

            toTop.addClass("show");

        } else {

            toTop.removeClass("show");
        }
    });
    
    // ------- to top -------
    $('.to_top').click(function() {
        $('html, body').animate({
            scrollTop: 0
        }, 0);
        return false;
    });

    // ------ sidemenu 7 ------
    $(".side_menu_btn").on("click", function() {
        $(this).toggleClass("active");
        $("#side_menu").toggleClass("show");
        $(".side_overlay").toggleClass("show");
    })

    $(".side_menu_cls").on("click", function() {
        $("#side_menu").removeClass("show");
        $(".side_overlay").removeClass("show");
    })

    $(".side_overlay").on("click", function() {
        $("#side_menu").removeClass("show");
        $(this).removeClass("show");
    })

    // --------- navbar active ---------
    $(".faq-category li a").on("click", function() {
        $(this).addClass("active");
        $(this).parent().siblings().children("a").removeClass("active");
    })

    // --------- navbar active ---------
    // $(".navbar").on( "click", ".nav-link" , function(){
    //     $(this).addClass("active");
    //     $(this).parents(".nav-item").siblings().find(".nav-link").removeClass("active");
    // })


    /* ==============  priceing_s2  ============== */
    $('#monthly-input2').on('change', function() {
        $(".yearly_price , .monthly_price").toggleClass("show");
    });
    /* ==============  priceing_s5  ============== */
    $('#monthly-input').on('change', function() {
        $(".monthly_price").show();
        $(".monthly_price").siblings(".yearly_price").hide();
    });
    $('#yearly-input').on('change', function() {
        $(".yearly_price").show();
        $(".yearly_price").siblings(".monthly_price").hide();
    });


/* ===============================  projects style-12  =============================== */
    var containerEl = document.querySelector('.projects.style-12 .items');
    var mixer = mixitup(containerEl);
    // ----- active & unactive -----
    $(".mix_tabs").on("click" , ".tab-link" , function(){
        $(this).addClass("active").siblings().removeClass("active");
    })




    // -------- counter --------
        $('.counter').countUp({
            delay: 10,
            time: 2000
        });

    // -------- blog effect --------
    $(".blog .blog_box").mouseenter(function(){
        $(this).find(".text").slideDown();
    })
    $(".blog .blog_box").mouseleave(function(){
        $(this).find(".text").slideUp();
    })

      // --------- fav btn ---------
  $(".fav-btn").on("click" , function(){
        $(this).toggleClass("active");
    })

    // --------- grid list view ---------
    $(".grid-list-btns").on( "click", ".bttn" , function(){
        $(this).addClass("active").siblings().removeClass("active");
    })

    $(".grid-list-btns").on( "click", ".list-btn" , function(){
        $(".products-content .products").addClass("list-view");
    })

    $(".grid-list-btns").on( "click", ".grid-btn" , function(){
        $(".products-content .products").removeClass("list-view");
    })


    // ------------ increase products -----------
    $(".qt-plus").click(function() {
        $(this).parent().children(".qt").html(parseInt($(this).parent().children(".qt").html()) + 1);
    });

    $(".qt-minus").click(function() {

        child = $(this).parent().children(".qt");

        if (parseInt(child.html()) > 1) {
            child.html(parseInt(child.html()) - 1);
        }

        $(this).parent().children(".full-price").addClass("minused");

    });

});

 // ---------- hover dropdown -----------
 const $dropdown = $(".dropdown");
 const $dropdownToggle = $(".dropdown-toggle");
 const $dropdownMenu = $(".dropdown-menu");
 const showClass = "show";

 $(window).on("load resize", function() {
    if (this.matchMedia("(min-width: 768px)").matches) {
      $dropdown.hover(
        function() {
          const $this = $(this);
          $this.addClass(showClass);
          $this.find($dropdownToggle).attr("aria-expanded", "true");
          $this.find($dropdownMenu).addClass(showClass);
        },
        function() {
          const $this = $(this);
          $this.removeClass(showClass);
          $this.find($dropdownToggle).attr("aria-expanded", "false");
          $this.find($dropdownMenu).removeClass(showClass);
        }
      );
    } else {
      $dropdown.off("mouseenter mouseleave");
    }
  });
  



// ------------ swiper sliders -----------
$(document).ready(function() {
    var swiper = new Swiper('.portfolio-slider .swiper-container', {
        slidesPerView: 3,
        spaceBetween: 30,
        speed: 1000,
        pagination: {
            el: ".portfolio-slider .swiper-pagination"
        },
        navigation: {
            nextEl: '.portfolio-slider .swiper-button-next',
            prevEl: '.portfolio-slider .swiper-button-prev',
        },
        mousewheel: false,
        keyboard: true,
        autoplay: {
            delay: 4000,
        },
        loop: true,
        breakpoints: {
            0: {
                slidesPerView: 1,
            },
            480: {
                slidesPerView: 2,
            },
            787: {
                slidesPerView: 2,
            },
            991: {
                slidesPerView: 3,
            },
            1200: {
                slidesPerView: 3,
            }
        }
    });

    // ------------ blog sliders -----------
    var swiper = new Swiper('.blog_slider .swiper-container', {
        slidesPerView: 3,
        spaceBetween: 30,
        speed: 1000,
        pagination: {
            el: ".blog_slider .swiper-pagination"
        },
        navigation: {
            nextEl: '.blog_slider .swiper-button-next',
            prevEl: '.blog_slider .swiper-button-prev',
        },
        mousewheel: false,
        keyboard: true,
        autoplay: {
            delay: 4000,
        },
        // loop: true,
        breakpoints: {
            0: {
                slidesPerView: 1,
            },
            480: {
                slidesPerView: 2,
            },
            787: {
                slidesPerView: 2,
            },
            991: {
                slidesPerView: 3,
            },
            1200: {
                slidesPerView: 4,
            }
        }
    });

    // ------------ services sliders -----------
    var swiper = new Swiper('.services_slider .swiper-container', {
        slidesPerView: 3,
        spaceBetween: 30,
        speed: 1000,
        pagination: {
            el: ".services_slider .swiper-pagination",
            clickable: true,
        },
        navigation: {
            nextEl: '.services_slider .swiper-button-next',
            prevEl: '.services_slider .swiper-button-prev',
        },
        mousewheel: false,
        keyboard: true,
        autoplay: {
            delay: 4000,
        },
        loop: true,
        breakpoints: {
            0: {
                slidesPerView: 1,
            },
            480: {
                slidesPerView: 2,
            },
            787: {
                slidesPerView: 2,
            },
            991: {
                slidesPerView: 3,
            },
            1200: {
                slidesPerView: 3,
            }
        }
    });

    // ------------ works sliders -----------
    var swiper = new Swiper('.works_slider .swiper-container', {
        slidesPerView: 3,
        spaceBetween: 30,
        speed: 1000,
        pagination: {
            el: ".works_slider .swiper-pagination",
            clickable: true,
        },
        navigation: {
            nextEl: '.works_slider .swiper-button-next',
            prevEl: '.works_slider .swiper-button-prev',
        },
        mousewheel: false,
        keyboard: true,
        autoplay: {
            delay: 4000,
        },
        loop: true,
        breakpoints: {
            0: {
                slidesPerView: 1,
            },
            480: {
                slidesPerView: 1,
            },
            787: {
                slidesPerView: 2,
            },
            991: {
                slidesPerView: 2,
            },
            1200: {
                slidesPerView: 2,
            }
        }
    });

    // ------------ works sliders -----------
    var swiper = new Swiper('.reviews_slider .swiper-container', {
        effect: "fade",
        slidesPerView: 1,
        spaceBetween: 0,
        speed: 1000,
        pagination: {
            el: ".reviews_slider .swiper-pagination",
            clickable: true,
        },
        navigation: {
            nextEl: '.reviews_slider .swiper-button-next',
            prevEl: '.reviews_slider .swiper-button-prev',
        },
        mousewheel: false,
        keyboard: true,
        autoplay: {
            delay: 4000,
        },
        loop: true,
    });

    // ------------ works sliders -----------
    var swiper = new Swiper('.testimonial-slider.style-3 .swiper-container', {
        slidesPerView: 3,
        spaceBetween: 100,
        speed: 1000,
        pagination: {
            el: ".testimonial-slider.style-3 .swiper-pagination",
            clickable: true,
        },
        navigation: {
            nextEl: '.testimonial-slider.style-3 .swiper-button-next',
            prevEl: '.testimonial-slider.style-3 .swiper-button-prev',
        },
        mousewheel: false,
        keyboard: true,
        autoplay: {
            delay: 4000,
        },
        loop: true,
        breakpoints: {
            0: {
                slidesPerView: 1,
            },
            480: {
                slidesPerView: 1,
            },
            787: {
                slidesPerView: 2,
            },
            991: {
                slidesPerView: 2,
            },
            1200: {
                slidesPerView: 3,
            }
        }
    });

    // ------------ works sliders -----------
    var swiper = new Swiper('.screenshots-slider.style-4 .swiper-container', {
        slidesPerView: 5,
        spaceBetween: 0,
        centeredSlides: true,
        speed: 1000,
        pagination: false,
        navigation: false,
        mousewheel: false,
        keyboard: true,
        autoplay: {
            delay: 4000,
        },
        loop: true,
        breakpoints: {
            0: {
                slidesPerView: 2,
            },
            480: {
                slidesPerView: 2,
            },
            787: {
                slidesPerView: 3,
            },
            991: {
                slidesPerView: 3,
            },
            1200: {
                slidesPerView: 5,
            }
        }
    });
      
    // ------------ clients sliders -----------
    let SwiperBottom = new Swiper('.clients-slider5 .swiper-container', {
    spaceBetween: 0,
    centeredSlides: true,
    slidesPerView: 6,
    speed: 6000,
    autoplay: {
        delay: 1,
    },
    loop: true,
    allowTouchMove: false,
    disableOnInteraction: true,
    breakpoints: {
        0: {
            slidesPerView: 2,
        },
        480: {
            slidesPerView: 2,
        },
        787: {
            slidesPerView: 3,
        },
        991: {
            slidesPerView: 4,
        },
        1200: {
            slidesPerView: 6,
        }
    }
    });
      
    // ------------ testimonial sliders -----------
    var swiper = new Swiper('.testimonial-slider.style-5 .swiper-container', {
        slidesPerView: 4,
        spaceBetween: 0,
        speed: 1000,
        pagination: {
            el: ".testimonial-slider.style-5 .swiper-pagination",
            clickable: true,
        },
        navigation: false,
        mousewheel: false,
        keyboard: true,
        autoplay: {
            delay: 4000,
        },
        loop: true,
        breakpoints: {
            0: {
                slidesPerView: 1,
            },
            480: {
                slidesPerView: 1,
            },
            787: {
                slidesPerView: 2,
            },
            991: {
                slidesPerView: 3,
            },
            1200: {
                slidesPerView: 4,
            }
        }
    });

    // ------------ services sliders -----------
    var swiper = new Swiper('.services-slider.style-6 .swiper-container', {
        slidesPerView: 4,
        centeredSlides: true,
        spaceBetween: 0,
        speed: 1000,
        pagination: false,
        navigation: false,
        mousewheel: false,
        keyboard: true,
        autoplay: {
            delay: 4000,
        },
        loop: true,
        breakpoints: {
            0: {
                slidesPerView: 1,
            },
            480: {
                slidesPerView: 1,
            },
            787: {
                slidesPerView: 1,
            },
            991: {
                slidesPerView: 2,
            },
            1200: {
                slidesPerView: 4,
            }
        },
        on: {
            slideChange: function () {
              var activeIndex = this.activeIndex;
              var realIndex = this.slides.eq(activeIndex).attr('data-swiper-slide-index');
             $('.swiper-slide').removeClass('swiper-slide-nth-prev-2 swiper-slide-nth-next-2');
             $('.swiper-slide[data-swiper-slide-index="'+realIndex+'"]').prev().prev().addClass('swiper-slide-nth-prev-2');
             $('.swiper-slide[data-swiper-slide-index="'+realIndex+'"]').next().next().addClass('swiper-slide-nth-next-2');
            },
          }
    });

    // ------------ works sliders -----------
    var swiper = new Swiper('.slider-3items .swiper-container', {
        slidesPerView: 3,
        spaceBetween: 0,
        speed: 1000,
        pagination: {
            el: ".slider-3items .swiper-pagination",
            clickable: true,
        },
        navigation: {
            nextEl: '.slider-3items .swiper-button-next',
            prevEl: '.slider-3items .swiper-button-prev',
        },
        mousewheel: false,
        keyboard: true,
        autoplay: {
            delay: 4000,
        },
        loop: true,
        breakpoints: {
            0: {
                slidesPerView: 1,
            },
            480: {
                slidesPerView: 1,
            },
            787: {
                slidesPerView: 2,
            },
            991: {
                slidesPerView: 2,
            },
            1200: {
                slidesPerView: 3,
            }
        }
    });

    // ------------ works sliders -----------
    var swiper = new Swiper('.testi-slider.style-6 .swiper-container', {
        slidesPerView: 1,
        spaceBetween: 0,
        speed: 1000,
        pagination: false,
        navigation: {
            nextEl: '.testi-slider.style-6 .swiper-button-next',
            prevEl: '.testi-slider.style-6 .swiper-button-prev',
        },
        mousewheel: false,
        keyboard: true,
        autoplay: {
            delay: 4000,
        },
        loop: true
    });

    // ------------ works sliders -----------
    var swiper = new Swiper('.blog-details-slider .swiper-container', {
        slidesPerView: 1,
        spaceBetween: 0,
        effect: "fade",
        speed: 1000,
        pagination: {
            el: ".blog-details-slider .swiper-pagination",
            clickable: "true",
        },
        navigation: {
            nextEl: '.blog-details-slider .swiper-button-next',
            prevEl: '.blog-details-slider .swiper-button-prev',
        },
        mousewheel: false,
        keyboard: true,
        autoplay: {
            delay: 4000,
        },
        loop: true
    });

    // ------------ related-postes-slider -----------
    var swiper = new Swiper('.related-postes-slider .swiper-container', {
        slidesPerView: 3,
        spaceBetween: 80,
        centeredSlides: true,
        speed: 1000,
        pagination: false,
        navigation: {
            nextEl: '.related-postes-slider .swiper-button-next',
            prevEl: '.related-postes-slider .swiper-button-prev',
        },
        mousewheel: false,
        keyboard: true,
        autoplay: {
            delay: 4000,
        },
        loop: true,
        breakpoints: {
            0: {
                slidesPerView: 1,
            },
            480: {
                slidesPerView: 1,
            },
            787: {
                slidesPerView: 2,
            },
            991: {
                slidesPerView: 2,
            },
            1200: {
                slidesPerView: 3,
            }
        }
    });

    // ------------ related-postes-slider -----------
    var swiper = new Swiper('.culture-slider .swiper-container', {
        slidesPerView: 4,
        spaceBetween: 30,
        centeredSlides: true,
        speed: 1000,
        pagination: {
            el: ".swiper-pagination",
            clickable: "true",
        },
        navigation: false,
        mousewheel: false,
        keyboard: true,
        autoplay: {
            delay: 4000,
        },
        loop: true,
        breakpoints: {
            0: {
                slidesPerView: 1,
            },
            480: {
                slidesPerView: 1,
            },
            787: {
                slidesPerView: 2,
            },
            991: {
                slidesPerView: 3,
            },
            1200: {
                slidesPerView: 4,
            }
        }
    });

    // ------------ gallery-thumbs-slider -----------
    var galleryThumbs = new Swiper('.product .gallery-thumbs', {
        spaceBetween: 20,
        slidesPerView: 6,
        freeMode: true,
        watchSlidesVisibility: true,
        watchSlidesProgress: true,
        direction: 'vertical',
    });
    var galleryTop = new Swiper('.product .gallery-top', {
        spaceBetween: 10,
        navigation: false,
        thumbs: {
            swiper: galleryThumbs
        }
    });

    // ------------ related-postes-slider -----------
    var swiper = new Swiper('.related-products-slider .swiper-container', {
        slidesPerView: 5,
        spaceBetween: 24,
        // centeredSlides: true,
        speed: 1000,
        pagination: false,
        navigation: {
            nextEl: '.related-products-slider .swiper-button-next',
            prevEl: '.related-products-slider .swiper-button-prev',
        },
        mousewheel: false,
        keyboard: true,
        autoplay: {
            delay: 4000,
        },
        loop: true,
        breakpoints: {
            0: {
                slidesPerView: 1,
            },
            480: {
                slidesPerView: 1,
            },
            787: {
                slidesPerView: 2,
            },
            991: {
                slidesPerView: 3,
            },
            1200: {
                slidesPerView: 5,
            }
        }
    });

    // ------------ features-slider7 -----------
    var swiper = new Swiper('.features-slider7 .swiper-container', {
        spaceBetween: 50,
        centeredSlides: true,
        // slidesPerView: 6,
        speed: 10000,
        autoplay: {
            delay: 1,
        },
        loop: true,
    //   allowTouchMove: false,
        disableOnInteraction: true,
        breakpoints: {
            0: {
                slidesPerView: 1,
            },
            480: {
                slidesPerView: 1,
            },
            787: {
                slidesPerView: 1,
            },
            991: {
                slidesPerView: 2,
            },
            1200: {
                slidesPerView: 3,
            }
        }
    });

    // ------------ projects-slider7 -----------
    var swiper = new Swiper('.projects-slider7 .swiper-container', {
        // slidesPerView: 5,
        spaceBetween: 40,
        // centeredSlides: true,
        speed: 1000,
        pagination: false,
        navigation: {
            nextEl: '.projects.style-7 .swiper-button-next',
            prevEl: '.projects.style-7 .swiper-button-prev',
        },
        mousewheel: false,
        keyboard: true,
        autoplay: {
            delay: 5000,
        },
        observer: true,
        observeParents: true,
        loop: false,
        breakpoints: {
            0: {
                slidesPerView: 1,
            },
            480: {
                slidesPerView: 1,
            },
            787: {
                slidesPerView: 1,
            },
            991: {
                slidesPerView: 2,
            },
            1200: {
                slidesPerView: 2,
            }
        }
    });

    // ------------ testimonials-slider -----------
    var swiper = new Swiper('.testimonials-slider7 .swiper-container', {
        slidesPerView: 1,
        spaceBetween: 0,
        // centeredSlides: true,
        speed: 1000,
        pagination: false,
        navigation: false,
        mousewheel: false,
        keyboard: true,
        autoplay: {
            delay: 5000,
        },
        loop: true,
    });

    // ------------ features-slider7 -----------
    var swiper = new Swiper('.services-slider8 .swiper-container', {
        spaceBetween: 50,
        // centeredSlides: true,
        // slidesPerView: 6,
        speed: 10000,
        autoplay: {
            delay: 1,
        },
        loop: true,
    //   allowTouchMove: false,
        disableOnInteraction: true,
        breakpoints: {
            0: {
                slidesPerView: 1,
            },
            480: {
                slidesPerView: 1,
            },
            787: {
                slidesPerView: 1,
            },
            991: {
                slidesPerView: 3,
            },
            1200: {
                slidesPerView: 4,
            }
        }
    });

    // ------------ features-slider7 -----------
    var swiper = new Swiper('.imgs-content-slider .swiper-container', {
        spaceBetween: 50,
        // centeredSlides: true,
        // slidesPerView: 6,
        speed: 10000,
        autoplay: {
            delay: 1,
        },
        loop: true,
    //   allowTouchMove: false,
        disableOnInteraction: true,
        breakpoints: {
            0: {
                slidesPerView: 1,
            },
            480: {
                slidesPerView: 1,
            },
            787: {
                slidesPerView: 1,
            },
            991: {
                slidesPerView: 3,
            },
            1200: {
                slidesPerView: 4,
            }
        }
    });

    // ------------ features-slider7 -----------
    var swiper = new Swiper('.careers-positions-slider5 .swiper-container', {
        spaceBetween: 30,
        // centeredSlides: true,
        // slidesPerView: 6,
        speed: 1000,
        autoplay: {
            delay: 5000,
        },
        loop: true,
        pagination: false,
        navigation: {
            nextEl: '.careers-positions-slider5 .swiper-button-next',
            prevEl: '.careers-positions-slider5 .swiper-button-prev',
        },
        breakpoints: {
            0: {
                slidesPerView: 1,
            },
            480: {
                slidesPerView: 1,
            },
            787: {
                slidesPerView: 2,
            },
            991: {
                slidesPerView: 3,
            },
            1200: {
                slidesPerView: 3,
            }
        }
    });


    // ------------ works sliders -----------
    var swiper = new Swiper('.projects-slider8 .swiper-container', {
        slidesPerView: 1,
        spaceBetween: 0,
        speed: 1200,
        pagination: false,
        navigation: {
            nextEl: '.projects.style-8 .swiper-button-next',
            prevEl: '.projects.style-8 .swiper-button-prev',
        },
        mousewheel: false,
        keyboard: true,
        autoplay: {
            delay: 4000,
        },
        loop: false,
    });

     // ------------ about2-imgs-slider -----------
     var swiper = new Swiper('.about2-imgs-slider .swiper-container', {
        spaceBetween: 50,
        // centeredSlides: true,
        // slidesPerView: 6,
        speed: 10000,
        autoplay: {
            delay: 1,
        },
        loop: true,
    //   allowTouchMove: false,
        disableOnInteraction: true,
        breakpoints: {
            0: {
                slidesPerView: 1,
            },
            480: {
                slidesPerView: 1,
            },
            787: {
                slidesPerView: 1,
            },
            991: {
                slidesPerView: 3,
            },
            1200: {
                slidesPerView: 3,
            }
        }
    });

    // ------------ login sliders -----------
    var swiper = new Swiper('.sign-imgs-slider .swiper-container', {
        slidesPerView: 1,
        spaceBetween: 0,
        speed: 1000,
        pagination: {
            el: ".sign-imgs-slider .swiper-pagination",
            clickable: true,
        },
        navigation: false,
        mousewheel: false,
        keyboard: true,
        autoplay: {
            delay: 4000,
        },
        loop: true,
    });

    // ------------ login sliders -----------
    var swiper = new Swiper('.testimonials-slider11 .swiper-container', {
        slidesPerView: 1,
        spaceBetween: 0,
        speed: 1000,
        pagination: {
            el: ".testimonials-slider11 .swiper-pagination",
            clickable: true,
        },
        navigation: false,
        mousewheel: false,
        keyboard: true,
        autoplay: {
            delay: 6000,
        },
        loop: true,
    });


    // ------------ features-line-slider12 -----------
    var swiper = new Swiper('.features-line-slider12 .swiper-container', {
        spaceBetween: 0,
        centeredSlides: true,
        // slidesPerView: 6,
        speed: 10000,
        autoplay: {
            delay: 1,
        },
        loop: true,
    //   allowTouchMove: false,
        disableOnInteraction: true,
        breakpoints: {
            0: {
                slidesPerView: 1,
            },
            480: {
                slidesPerView: 1,
            },
            787: {
                slidesPerView: 1,
            },
            991: {
                slidesPerView: 2,
            },
            1200: {
                slidesPerView: 2,
            }
        }
    });

    // ------------ collections-slider12 -----------
    var swiper = new Swiper('.collections-slider12 .swiper-container', {
        spaceBetween: 30,
        // centeredSlides: true,
        // slidesPerView: 6,
        speed: 1000,
        autoplay: {
            delay: 5000,
        },
        loop: false,
        pagination: false,
        navigation: false,
        breakpoints: {
            0: {
                slidesPerView: 1,
            },
            480: {
                slidesPerView: 1,
            },
            787: {
                slidesPerView: 2,
            },
            991: {
                slidesPerView: 3,
            },
            1200: {
                slidesPerView: 3,
            }
        }
    });

    // ------------ projects-slider13 -----------
    var swiper = new Swiper('.projects-slider13 .swiper-container', {
        spaceBetween: 30,
        // centeredSlides: true,
        // slidesPerView: 6,
        observer: true,
        observeParents: true,
        speed: 1000,
        autoplay: {
            delay: 5000,
        },
        loop: true,
        pagination: false,
        navigation: false,
        breakpoints: {
            0: {
                slidesPerView: 1,
            },
            480: {
                slidesPerView: 1,
            },
            787: {
                slidesPerView: 2,
            },
            991: {
                slidesPerView: 2,
            },
            1200: {
                slidesPerView: 2,
            }
        }
    });

    // ------------ projects-slider13 -----------
    var swiper = new Swiper('.testimonials-slider14 .swiper-container', {
        spaceBetween: 50,
        // centeredSlides: true,
        // slidesPerView: 6,
        speed: 1000,
        autoplay: {
            delay: 5000,
        },
        loop: false,
        pagination: false,
        navigation: false,
        breakpoints: {
            0: {
                slidesPerView: 1,
            },
            480: {
                slidesPerView: 1,
            },
            787: {
                slidesPerView: 2,
            },
            991: {
                slidesPerView: 2,
            },
            1200: {
                slidesPerView: 3,
            }
        }
    });

});


/* ===============================  Preloader page  =============================== */
// $( function() {

//     paceOptions = {
//         ajax: true,
//         document: true,
//         eventLag: false
//     };

//     Pace.on('done', function () {
//         $('#preloader').addClass("isdone");
//         $('.loading').addClass("isdone");
//     });
// } );

$(window).on("load", function() {
    $("#preloader").addClass("isdone");
});

$( function() {
    // ---------- portfolio mixitup -----------
    var containerEl = document.querySelector('.mix-container');
    var mixer = mixitup(containerEl);
} );


$(function() {
    $('#profile-pic').on('change', function(e) {
      var file = e.target.files[0];
      if (file) {
        var reader = new FileReader();
        reader.onload = function() {
          $('#profile-pic-preview').attr('src', reader.result).show();
        }
        reader.readAsDataURL(file);
      }
    });
  });
  var countries = {
    africa: [
        { name: "Algeria", cities: ["Algiers", "Oran", "Constantine", "Annaba", "Blida"] },
        { name: "Angola", cities: ["Luanda", "Huambo", "Lobito", "Benguela", "Kuito"] },
        { name: "Benin", cities: ["Cotonou", "Porto-Novo", "Parakou", "Djougou", "Bohicon"] },
        { name: "Botswana", cities: ["Gaborone", "Francistown", "Molepolole", "Serowe", "Selebi-Phikwe"] },
        { name: "Burkina Faso", cities: ["Ouagadougou", "Bobo-Dioulasso", "Koudougou", "Ouahigouya", "Banfora"] },
        { name: "Burundi", cities: ["Bujumbura", "Gitega", "Ngozi", "Ruyigi", "Muyinga"] },
        { name: "Cabo Verde", cities: ["Praia", "Mindelo", "Santa Maria", "Assomada", "São Filipe"] },
        { name: "Cameroon", cities: ["Yaoundé", "Douala", "Bamenda", "Bafoussam", "Garoua"] },
        { name: "Central African Republic", cities: ["Bangui", "Bimbo", "Berbérati", "Carnot", "Sibut"] },
        { name: "Chad", cities: ["N'Djamena", "Moundou", "Sarh", "Abéché", "Kelo"] },
        { name: "Comoros", cities: ["Moroni", "Moutsamoudou", "Fomboni", "Domoni", "Sima"] },
        { name: "Democratic Republic of the Congo", cities: ["Kinshasa", "Lubumbashi", "Mbuji-Mayi", "Kananga", "Kisangani"] },
        { name: "Republic of the Congo", cities: ["Brazzaville", "Pointe-Noire", "Dolisie", "Kindamba", "Impfondo"] },
        { name: "Côte d'Ivoire", cities: ["Abidjan", "Bouaké", "Daloa", "Yamoussoukro", "Korhogo"] },
        { name: "Djibouti", cities: ["Djibouti", "Ali Sabieh", "Tadjourah", "Obock", "Dikhil"] },
        { name: "Egypt", cities: ["Cairo", "Alexandria", "Giza", "Shubra El-Kheima", "Port Said"] },
        { name: "Equatorial Guinea", cities: ["Malabo", "Bata", "Ebebiyín", "Aconibe", "Anisoc"] },
        { name: "Eritrea", cities: ["Asmara", "Keren", "Massawa", "Assab", "Mendefera"] },
        { name: "Eswatini", cities: ["Mbabane", "Manzini", "Big Bend", "Malkerns", "Nhlangano"] },
        { name: "Ethiopia", cities: ["Addis Ababa", "Dire Dawa", "Mekelle", "Gonder", "Bahir Dar"] },
        { name: "Gabon", cities: ["Libreville", "Port-Gentil", "Franceville", "Oyem", "Moanda"] },
        { name: "Gambia", cities: ["Banjul", "Serekunda", "Brikama", "Bakau", "Farafenni"] },
        { name: "Ghana", cities: ["Accra", "Kumasi", "Tamale", "Takoradi", "Cape Coast"] },
        { name: "Guinea", cities: ["Conakry", "Nzérékoré", "Kankan", "Kindia", "Gueckedou"] },
        { name: "Guinea-Bissau", cities: ["Bissau", "Bafatá", "Gabú", "Canchungo", "Fulacunda"] },
        { name: "Kenya", cities: ["Nairobi", "Mombasa", "Kisumu", "Nakuru", "Eldoret"] },
        { name: "Lesotho", cities: ["Maseru", "Teyateyaneng", "Mafeteng", "Hlotse", "Mohale's Hoek"] },
        { name: "Liberia", cities: ["Monrovia", "Gbarnga", "Bensonville", "Harper", "Kakata"] },
        { name: "Libya", cities: ["Tripoli", "Benghazi", "Misrata", "Tarhuna", "Zawiya"] },
        { name: "Madagascar", cities: ["Antananarivo", "Toamasina", "Antsirabe", "Fianarantsoa", "Mahajanga"] },
        { name: "Malawi", cities: ["Lilongwe", "Blantyre", "Mzuzu", "Zomba", "Kasungu"] },
        { name: "Mali", cities: ["Bamako", "Sikasso", "Mopti", "Koutiala", "Kayes"] },
        { name: "Mauritania", cities: ["Nouakchott", "Nouadhibou", "Rosso", "Kaédi", "Zouérat"] },
        { name: "Mauritius", cities: ["Port Louis", "Beau Bassin-Rose Hill", "Vacoas-Phoenix", "Curepipe", "Quatre Bornes"] },
        { name: "Morocco", cities: ["Casablanca", "Rabat", "Fes", "Marrakech", "Tangier"] },
        { name: "Mozambique", cities: ["Maputo", "Matola", "Beira", "Nampula", "Chimoio"] },
        { name: "Namibia", cities: ["Windhoek", "Rundu", "Walvis Bay", "Oshakati", "Swakopmund"] },
        { name: "Niger", cities: ["Niamey", "Zinder", "Maradi", "Agadez", "Tahoua"] },
        { name: "Nigeria", cities: ["Lagos", "Kano", "Ibadan", "Abuja", "Port Harcourt"] },
        { name: "Rwanda", cities: ["Kigali", "Butare", "Gitarama", "Ruhengeri", "Gisenyi"] },
        { name: "São Tomé and Príncipe", cities: ["São Tomé", "Trindade", "Guadalupe", "Santo Amaro", "Neves"] },
        { name: "Senegal", cities: ["Dakar", "Thiès", "Saint-Louis", "Ziguinchor", "Tambacounda"] },
        { name: "Seychelles", cities: ["Victoria", "Anse Boileau", "Bel Ombre", "Beau Vallon", "Cascade"] },
        { name: "Sierra Leone", cities: ["Freetown", "Bo", "Kenema", "Koidu", "Makeni"] },
        { name: "Somalia", cities: ["Mogadishu", "Hargeisa", "Bosaso", "Kismayo", "Garoowe"] },
        { name: "South Africa", cities: ["Johannesburg", "Cape Town", "Durban", "Pretoria", "Port Elizabeth"] },
        { name: "South Sudan", cities: ["Juba", "Wau", "Malakal", "Yei", "Bor"] },
        { name: "Sudan", cities: ["Khartoum", "Omdurman", "Kassala", "Nyala", "Port Sudan"] },
        { name: "Tanzania", cities: ["Dar es Salaam", "Mwanza", "Dodoma", "Arusha", "Mbeya"] },
        { name: "Togo", cities: ["Lomé", "Sokodé", "Kara", "Atakpamé", "Kpalimé"] },
        { name: "Tunisia", cities: ["Tunis", "Sfax", "Sousse", "Kairouan", "Bizerte"] },
        { name: "Uganda", cities: ["Kampala", "Gulu", "Lira", "Mbarara", "Jinja"] },
        { name: "Zambia", cities: ["Lusaka", "Kitwe", "Ndola", "Kabwe", "Chingola"] },
        { name: "Zimbabwe", cities: ["Harare", "Bulawayo", "Chitungwiza", "Mutare", "Gweru"]}],
    europe: [
        { name: "Italy", cities: ["Rome", "Milan", "Naples", "Turin", "Palermo", "Genoa"] },
        { name: "Germany", cities: ["Berlin", "Hamburg", "Munich", "Frankfurt", "Cologne", "Stuttgart"] },
        { name: "United Kingdom", cities: ["London", "Manchester", "Birmingham", "Glasgow", "Edinburgh", "Belfast"] },
        { name: "Netherlands", cities: ["Amsterdam", "Rotterdam", "The Hague", "Utrecht", "Eindhoven", "Tilburg"] },
        { name: "Switzerland", cities: ["Zurich", "Geneva", "Basel", "Lausanne", "Bern", "Lucerne"] },
        { name: "Sweden", cities: ["Stockholm", "Gothenburg", "Malmö", "Uppsala", "Västerås", "Örebro"] }
      // Add more countries in Europe here
    ],
    // Add more regions here
  };

  function populateCountries() {
    var regionSelect = document.getElementById("regionSelect");
    var countrySelect = document.getElementById("countrySelect");
    var citySelect = document.getElementById("citySelect");
    var selectedRegion = regionSelect.value;
    countrySelect.innerHTML = "<option value=''>Select a country</option>"; // Reset the country dropdown
    citySelect.innerHTML = "<option value=''>Select a city</option>"; // Reset the city dropdown

    if (selectedRegion !== "") {
      var regionCountries = countries[selectedRegion];
      regionCountries.forEach(function(country) {
        var option = document.createElement("option");
        option.text = country.name;
        option.value = country.name;
        countrySelect.add(option);
      });
    }
  }

  function populateCities() {
    var regionSelect= document.getElementById("regionSelect");
    var countrySelect = document.getElementById("countrySelect");
    var citySelect = document.getElementById("citySelect");
    var selectedCountry = countrySelect.value;
    var selectedRegion = regionSelect.value;
    citySelect.innerHTML = "<option value=''>Select a city</option>"; // Reset the city dropdown

    if (selectedCountry !== "" && selectedRegion !== "") {
      var regionCountries = countries[selectedRegion];
      var arrcities = regionCountries.find(function(country) {
        return country.name === selectedCountry;
      }).cities;
      for (var i = 0; i < arrcities.length; i++) {
        var option = document.createElement("option");
        option.text = arrcities[i];
        option.value = arrcities[i];
        citySelect.add(option);
      //populateDropdown(citySelect, cities);
    }
  }}

  function populateDropdown(dropdown, items) {
    for (var i = 0; i < items.length; i++) {
      var option = document.createElement("option");
      option.text = items[i];
      option.value = items[i];
      
      dropdown.add(option);
    }
  }
  var cardTypeSelect = document.getElementById("cardTypeSelect");
  var pinInput = document.getElementById("pinInput");
  var codeInput = document.getElementById("codeInput");

  cardTypeSelect.addEventListener("change", function() {
    var selectedCardType = cardTypeSelect.value;
    if (selectedCardType === "amex") {
      codeInput.pattern = "\\d{4}"; // Set pattern for American Express code as a 4-digit number
    } else {
      codeInput.pattern = "\\d{3}"; // Set pattern for other card types code as a 3-digit number
    }
    pinInput.value = ""; // Clear the PIN input field
    codeInput.value = ""; // Clear the code input field
  });
//date exper date in sign up
/*$(function() {
    var currentDate = new Date();
    
    $("#datepicker").datepicker({
        changeMonth: true,         // Enable month dropdown
        changeYear: true,          // Enable year dropdown
        yearRange: "-0:+10",       // Show a range of 10 years from the current year
        showButtonPanel: true,     // Show the button panel with the Today button
        dateFormat: "yy-mm-dd",    // Set the desired date format
        minDate: currentDate,   
     beforeShowDay: function(date) {
            // Disable all dates before the current date
            var day = date.getDay();
            return [(day == currentDate.getDay() && date.getMonth() == currentDate.getMonth() && date.getFullYear() == currentDate.getFullYear()), ''];
        }, 
        onSelect: function(dateText) {
            // Handle the selected date
            console.log("Selected date:", dateText);
        }
    });
});*/


$(function() {
  var currentDate = new Date();

  $("#datepicker").datepicker({
    changeMonth: true,
    changeYear: true,
    yearRange: "-0:+10",
    showButtonPanel: true,
    dateFormat: "yy-mm-dd",
    minDate: currentDate,
    beforeShowDay: function(date) {
      // Disable all dates before today
      var day = date.getDay();
      var isDisabled = (date < currentDate);
      return [!isDisabled, ''];
    },
    onSelect: function(dateText) {
      console.log("Selected date:", dateText);
    }
  });
});





// script.js
var countrySelect = document.getElementById("countrySelect");
var phoneNumberInput = document.getElementById("phoneNumberInput");
var phoneNumberValidationMessage = document.getElementById("phoneNumberValidationMessage");

function updatePhoneNumberPattern() {
    var selectedCountry = countrySelect.value;
    var phoneNumberPattern = "";
  
    if (selectedCountry === "us") {
      phoneNumberPattern = "\\d{3}-\\d{3}-\\d{4}"; // Pattern for US phone number (e.g., 123-456-7890)
    } else if (selectedCountry === "uk") {
      phoneNumberPattern = "\\d{4}-\\d{6}"; // Pattern for UK phone number (e.g., 1234-567890)
    } else if (selectedCountry === "morocco") {
      phoneNumberPattern = "\\d{2}-\\d{2}-\\d{2}-\\d{2}-\\d{2}"; // Pattern for Morocco phone number (e.g., 06-12-34-56-78)
    } else if (selectedCountry === "spain") {
      phoneNumberPattern = "\\d{3}-\\d{2}-\\d{2}-\\d{2}-\\d{2}"; // Pattern for Spain phone number (e.g., 123-45-67-89)
    } else if (selectedCountry === "france") {
      phoneNumberPattern = "\\d{2}-\\d{2}-\\d{2}-\\d{2}-\\d{2}"; // Pattern for France phone number (e.g., 12-34-56-78-90)
    }
  
    phoneNumberInput.pattern = phoneNumberPattern;
    phoneNumberInput.value = ""; // Clear the phone number input field
    phoneNumberValidationMessage.textContent = ""; // Clear the validation message
  }

phoneNumberInput.addEventListener("input", function() {
  if (phoneNumberInput.checkValidity()) {
    phoneNumberValidationMessage.textContent = ""; // Clear the validation message if the input is valid
  } else {
    phoneNumberValidationMessage.textContent = "Invalid phone number"; // Display an error message if the input is invalid
  }
});



// script.js
//for RIB:
var ribInput = document.getElementById("ribInput");
var validationMessage = document.getElementById("validationMessage");

ribInput.addEventListener("input", function() {
  if (ribInput.checkValidity()) {
    validationMessage.textContent = ""; // Clear the validation message if the input is valid
  } else {
    validationMessage.textContent = "Invalid RIB"; // Display an error message if the input is invalid
  }
});
//for linkedin :
// script.js
var linkedinInput = document.getElementById("linkedinInput");
var linkedinValidationMessage = document.getElementById("linkedinValidationMessage");

linkedinInput.addEventListener("input", function() {
  if (linkedinInput.checkValidity()) {
    linkedinValidationMessage.textContent = ""; // Clear the validation message if the input is valid
  } else {
    linkedinValidationMessage.textContent = "Invalid LinkedIn profile link"; // Display an error message if the input is invalid
  }
});
//for Gmail :
// script.js
var gmailInput = document.getElementById("gmailInput");
var gmailValidationMessage = document.getElementById("gmailValidationMessage");

gmailInput.addEventListener("input", function() {
  if (gmailInput.checkValidity()) {
    gmailValidationMessage.textContent = ""; // Clear the validation message if the input is valid
  } else {
    gmailValidationMessage.textContent = "Invalid Gmail address"; // Display an error message if the input is invalid
  }
});

//control the age
var ageInput = document.querySelector('input[name="age"]');
var ageValidationMessage = document.getElementById("ageValidationMessage");

ageInput.addEventListener("input", function() {
  var age = parseInt(ageInput.value);
  if (isNaN(age) || age < 18) {
    ageInput.setCustomValidity("Please enter a number greater than 18."); // Set a custom validation message
    ageValidationMessage.textContent = "Please enter a number greater than 18."; // Display an error message
  } else {
    ageInput.setCustomValidity(""); // Clear the custom validation message
    ageValidationMessage.textContent = ""; // Clear the error message
  }
});


//Make sure  that the password and confirmation of passord the same

var password = document.getElementById("password");
    var confirmPassword = document.getElementById("confirmPassword");
    var passwordError = document.getElementById("passwordError");

    function validatePassword() {
        if (password.value !== confirmPassword.value) {
            passwordError.style.display = "block";
        } else {
            passwordError.style.display = "none";
        }
    }

    password.addEventListener("input", validatePassword);
    confirmPassword.addEventListener("input", validatePassword);



    // not display the submit button until password pattern is respected
    // Get the password input field and submit button
    const passwordInput = document.getElementById('password');
    const submitButton = document.getElementById('submitButton');

    // Function to enable or disable the submit button based on password validity
    function toggleSubmitButton() {
        if (passwordInput.checkValidity()) {
            submitButton.removeAttribute('disabled');
        } else {
            submitButton.setAttribute('disabled', true);
        }
    }

    // Listen for changes in the password input field
    passwordInput.addEventListener('input', toggleSubmitButton);
// pop up if error show up 

    // Function to display an error message as a pop-up
    function showErrorPopup(message) {
        alert(message);
    }







