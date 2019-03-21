/*
 * CreateX | Multipurpose Bootstrap Theme
 * Copyright 2019 Createx Studio
 * Theme Custom Scripts
 */

 /*global jQuery, iziToast, noUiSlider*/

jQuery(function($) {
  'use strict';
  
  // Disable default link behavior for dummy links that have href='#'
  //------------------------------------------------------------------------------
  function emptyLink(target) {
    $(target).on('click', function(e) {
      e.preventDefault();
    });
  }
	emptyLink('a[href="#"]');
  
	
	// Sticky Navbar
	//------------------------------------------------------------------------------
	function stickyNavbar() {
		var body = $('body'),
				navbar = $('.navbar-sticky'),
				navbarH = navbar.outerHeight();
		if(navbar.length) {
			$(window).on('scroll', function() {
				if($(this).scrollTop() > 500) {
					navbar.addClass('navbar-stuck');
					if(! navbar.hasClass('navbar-floating')) {
						body.css('padding-top', navbarH);
					}
				} else {
					navbar.removeClass('navbar-stuck');
					body.css('padding-top', 0);
				}
			});
		}
	}
	stickyNavbar();


	// Isotope Grid / Filters (Gallery)
	//------------------------------------------------------------------------------

	// Isotope Grid
	if($('.isotope-grid').length) {
		var $grid = $('.isotope-grid').imagesLoaded(function() {
			$grid.isotope({
				itemSelector: '.grid-item',
				transitionDuration: '0.7s',
				masonry: {
					columnWidth: '.grid-sizer',
					gutter: '.gutter-sizer'
				}
			});
		});
	}

	// Filtering
	if($('.filter-grid').length > 0) {
		var $filterGrid = $('.filter-grid');
		$('.nav-tabs').on( 'click', 'a', function(e) {
			e.preventDefault();
			$('.nav-tabs a').removeClass('active');
			$(this).addClass('active');
			var $filterValue = $(this).attr('data-filter');
			$filterGrid.isotope({ filter: $filterValue });
		});
	}


  // Search Toggle
  //---------------------------------------------------------
  function searchToggle(openTrigger, closeTrigger, target) {
    $(openTrigger).on('click', function() {
      $(target).addClass('is-open');
      setTimeout( function() {
        $(target + ' input').focus();
      }, 200);
    } );
    $(closeTrigger).on('click', function() {
      $(target).removeClass('is-open');
    } );
  }
	searchToggle('[data-toggle="search"]', '.search-close', '.search-box');
	

	// Search Autocomplete
	//---------------------------------------------------------
	function searchAutocomplete(target) {
		var options = {
			url: "search-autocomplete.json",
			getValue: "name",
			list: {
				match: {
					enabled: true
				}
			},
			template: {
				type: "custom",
				method: function(value, item) {
					return "<a href='" + item.link + "'><span class='ac-title'>" + value + "</span><span class='badge badge-" + item.badge + "'>" + item.type + "</span></a>";
				}
			}
		};
		if ($.fn.easyAutocomplete) {
			$(target).easyAutocomplete(options);
		}
	}
	searchAutocomplete('#site-search');


	// Off-Canvas (Sidebar)
  //------------------------------------------------------------------------------
  function offcanvasToggle(offcanvasOpenTrigger, target, offcanvasCloseTrigger) {
    $(offcanvasOpenTrigger).on('click', function(e) {
      var $target = $(this).attr('href');
      $($target).addClass('in-view');
      e.preventDefault();
    });
    $(offcanvasCloseTrigger).on('click', function() {
      $(target).removeClass('in-view');
    });
  }
	offcanvasToggle('[data-toggle="offcanvas"]', '.offcanvas-container', '.offcanvas-close');


	// Full Screen Overlay
	//------------------------------------------------------------------------------
	function fsOverlayToggle(fsOverlayOpenTrigger, target, fsOverlayCloseTrigger) {
    $(fsOverlayOpenTrigger).on('click', function(e) {
      var $target = $(this).attr('href');
			$($target).addClass('in-view');
      e.preventDefault();
		});
    $(fsOverlayCloseTrigger).on('click', function() {
      $(target).removeClass('in-view');
    });
	}
	fsOverlayToggle('[data-toggle="fullscreen-overlay"]', '.fs-overlay-wrapper', '.fs-overlay-close');

	
	// Smooth scroll to element
  //---------------------------------------------------------
	$( document ).on( 'click', '.scroll-to', function ( event ) {
		var target = $( this ).attr( 'href' );
		if ( '#' === target ) {
			return false;
		}

		var $target = $( target );
		if( $target.length > 0 ) {
			var $elemOffsetTop = $target.data( 'offset-top' ) || 75;
			$('html, body').stop().animate({scrollTop: $( this.hash ).offset().top - $elemOffsetTop}, 1200, 'easeOutExpo');
		}
		event.preventDefault();
	} );
	

	// Tooltips
	//------------------------------------------------------------------------------
	$('[data-toggle="tooltip"]').tooltip();


	// Popovers
	//------------------------------------------------------------------------------
	$('[data-toggle="popover"]').popover();


	// Filter List Groups
	//---------------------------------------------------------
	function filterList(trigger, searchBase) {
		$(trigger).each(function() {
			var self = $(this),
					target = self.data('filter'),
					search = self.find('input[type=text]'),
					filters = self.find('input[type=radio]');
			
			// Search
			search.keyup(function() {
				var searchQuery = search.val();
				if(searchBase === '.list-group-item') {
					$(searchBase).each(function() {
						var text = $(this).text().toLowerCase();
						(text.indexOf(searchQuery.toLowerCase()) == 0) ? $(this).show() : $(this).hide(); 
					});
				} else {
					$(searchBase).each(function() {
						var text = $(this).text().toLowerCase();
						(text.indexOf(searchQuery.toLowerCase()) == 0) ? $(this).parents('[data-filter-item]').show() : $(this).parents('[data-filter-item]').hide(); 
					});
				}
			});

			// Filters
			filters.on('click', function(e) {
				var targetItem = $(this).val();
				if(searchBase === '.list-group-item') {
					if(targetItem !== 'all') {
						$(searchBase).hide();
						$('[data-filter-item=' + targetItem + ']').show();
					} else {
						$(searchBase).show();
					}
				} else {
					if(targetItem !== 'all') {
						$(searchBase).parents('[data-filter-item]').hide();
						$('[data-filter-item=' + targetItem + ']').show();
					} else {
						$(searchBase).parents('[data-filter-item]').show();
					}
				}
				
			});
		});
	}
	filterList('[data-filter="#components-list"]', '.list-group-item');
	filterList('[data-filter="#components-grid"]', '.card-title');

	
	// Product Gallery
	//------------------------------------------------------------------------------
	function productGallery(target) {

		function activeHash(e) {
			var i = e.item.index;
			var $activeHash = $('.owl-item').eq(i).find('[data-hash]').attr('data-hash');
			$('.product-thumbnails li').removeClass('active');
			$('[href="#' + $activeHash + '"]').parent().addClass('active');
			$('[data-hash="' + $activeHash + '"]').parent().addClass('active');
		}

		if($(target).length) {
			// Carousel init
			$(target).owlCarousel({
				items: 1,
				loop: false,
				dots: false,
				URLhashListener: true,
				startPosition: 'URLHash',
				onTranslate: activeHash
			});
		}
	}
	productGallery('.product-carousel');

	
	// Featured Posts Slider (Linked Carousels)
	//------------------------------------------------------------------------------
	function linkedCarousels(triggerCarousel, targetCarousel) {
		if($(triggerCarousel).length) {
			$(triggerCarousel).on('change.owl.carousel', function(event) {
				if (event.namespace && event.property.name === 'position') {
					var target = event.relatedTarget.relative(event.property.value, true);
					$(targetCarousel).owlCarousel('to', target, 350, true);
				}
			});
		}
	}
	linkedCarousels('.post-cards-carousel', '.post-preview-img-carousel');
	

	// Form Validation
	//------------------------------------------------------------------------------
	window.addEventListener('load', function() {
		// Fetch all the forms we want to apply custom Bootstrap validation styles to
		var forms = document.getElementsByClassName('needs-validation');
		// Loop over them and prevent submissions
		var validation = Array.prototype.filter.call(forms, function(form) {
			form.addEventListener('submit', function(event) {
				if (form.checkValidity() === false) {
					event.preventDefault();
					event.stopPropagation();
				}
				form.classList.add('was-validated');
			}, false);
		});
	}, false);


	// Interactive Credit Card
	//------------------------------------------------------------------------------
	function creditCard(target) {
		if($(target).length) {
			$(target).card({
				form: target,
				container: '.card-wrapper'
			});
		}
	}
	creditCard('.interactive-credit-card');


	// Toast Notifications
	//------------------------------------------------------------------------------
	$('[data-toast]').on('click', function() {
		
		var self = $(this),
				$type = self.data('toast-type'),
				$icon = self.data('toast-icon'),
				$position = self.data('toast-position'),
				$title = self.data('toast-title'),
				$message = self.data('toast-message'),
				toastOptions = '';
		
		switch ($position) {
			case 'topRight':
				toastOptions = {
					class: 'iziToast-' + $type || '',
					title: $title || 'Title',
					message: $message || 'toast message',
					animateInside: false,
					position: 'topRight',
					progressBar: false,
					icon: $icon,
					timeout: 3200,
					transitionIn: 'fadeInLeft',
					transitionOut: 'fadeOut',
					transitionInMobile: 'fadeIn',
					transitionOutMobile: 'fadeOut'
				};
				break;
			case 'bottomRight':
				toastOptions = {
					class: 'iziToast-' + $type || '',
					title: $title || 'Title',
					message: $message || 'toast message',
					animateInside: false,
					position: 'bottomRight',
					progressBar: false,
					icon: $icon,
					timeout: 3200,
					transitionIn: 'fadeInLeft',
					transitionOut: 'fadeOut',
					transitionInMobile: 'fadeIn',
					transitionOutMobile: 'fadeOut'
				};
				break;
			case 'topLeft':
				toastOptions = {
					class: 'iziToast-' + $type || '',
					title: $title || 'Title',
					message: $message || 'toast message',
					animateInside: false,
					position: 'topLeft',
					progressBar: false,
					icon: $icon,
					timeout: 3200,
					transitionIn: 'fadeInRight',
					transitionOut: 'fadeOut',
					transitionInMobile: 'fadeIn',
					transitionOutMobile: 'fadeOut'
				};
				break;
			case 'bottomLeft':
				toastOptions = {
					class: 'iziToast-' + $type || '',
					title: $title || 'Title',
					message: $message || 'toast message',
					animateInside: false,
					position: 'bottomLeft',
					progressBar: false,
					icon: $icon,
					timeout: 3200,
					transitionIn: 'fadeInRight',
					transitionOut: 'fadeOut',
					transitionInMobile: 'fadeIn',
					transitionOutMobile: 'fadeOut'
				};
				break;
			case 'topCenter':
				toastOptions = {
					class: 'iziToast-' + $type || '',
					title: $title || 'Title',
					message: $message || 'toast message',
					animateInside: false,
					position: 'topCenter',
					progressBar: false,
					icon: $icon,
					timeout: 3200,
					transitionIn: 'fadeInDown',
					transitionOut: 'fadeOut',
					transitionInMobile: 'fadeIn',
					transitionOutMobile: 'fadeOut'
				};
				break;
			case 'bottomCenter':
				toastOptions = {
					class: 'iziToast-' + $type || '',
					title: $title || 'Title',
					message: $message || 'toast message',
					animateInside: false,
					position: 'bottomCenter',
					progressBar: false,
					icon: $icon,
					timeout: 3200,
					transitionIn: 'fadeInUp',
					transitionOut: 'fadeOut',
					transitionInMobile: 'fadeIn',
					transitionOutMobile: 'fadeOut'
				};
				break;
			default:
				toastOptions = {
					class: 'iziToast-' + $type || '',
					title: $title || 'Title',
					message: $message || 'toast message',
					animateInside: false,
					position: 'topRight',
					progressBar: false,
					icon: $icon,
					timeout: 3200,
					transitionIn: 'fadeInLeft',
					transitionOut: 'fadeOut',
					transitionInMobile: 'fadeIn',
					transitionOutMobile: 'fadeOut'
				};
		}

		iziToast.show(toastOptions);
	});


	// Team Style 1 (Hover effect: social buttons)
	//------------------------------------------------------------------------------
	$('.no-touchevents .team-card-style-1').on('mouseover', function() {
		var $socialBtn = $(this).find('.social-btn');
		function btnAddHover() {
			$socialBtn.addClass('hover')
		}
		setTimeout(btnAddHover, 120);
	});
	$('.no-touchevents .team-card-style-1').on('mouseout', function() {
		var $socialBtn = $(this).find('.social-btn');
		function btnRemoveHover() {
			$socialBtn.removeClass('hover')
		}
		setTimeout(btnRemoveHover, 120);
	});


	// Countdown
	//------------------------------------------------------------------------------
	function countDownFunc( items, trigger ) {
		items.each( function() {
			var countDown = $(this),
					dateTime = $(this).data('date-time'),
					labels = $(this).data('labels');

			var countDownTrigger = ( trigger ) ? trigger : countDown;
			countDownTrigger.countdown(dateTime, function(event) {
				$(this).html(event.strftime(
					'<div class="countdown-item"><div class="countdown-value">%D</div><div class="countdown-label">' + labels['label-day'] + '</div></div><div class="countdown-item"><div class="countdown-value">%H</div><div class="countdown-label">' + labels['label-hour'] + '</div></div><div class="countdown-item"><div class="countdown-value">%M</div><div class="countdown-label">' + labels['label-minute'] + '</div></div><div class="countdown-item"><div class="countdown-value">%S</div><div class="countdown-label">' + labels['label-second'] + '</div></div>'
				));
			});
		});
	}
	countDownFunc( $('.countdown') );


	// Animate Progress Bars on scroll
	//------------------------------------------------------------------------------
	function animateProgerss(selector) {
		$(selector).on('inview', function(event, isInView) {
			var progressBar = $(this).find('.progress-bar'),
					valueNow = progressBar.attr('aria-valuenow');
			if (isInView) {
				$(this).addClass('progress-in-view');
				progressBar.css('width', valueNow + '%');
			}
		});
	}
	animateProgerss('.progress-animate-fill');


	// Animate Digits
	//------------------------------------------------------------------------------
	function animateDigits(selector) {
		$(selector).one('inview', function(event, isInView) {
			var digits = $(this).find('.animated-digits-digit > span'),
					number = $(this).data('number');
			if (isInView) {
				digits.animateNumber({
					number: number
				}, 1200);
			}
		});
	}
	animateDigits('.animated-digits');


	// Animated Scroll to Top Button
	//------------------------------------------------------------------------------
	function scrollBackTop(trigger, target) {
		if ( $(trigger).length > 0 ) {
			$( window ).on( 'scroll', function () {
				if ( $( this ).scrollTop() > 600 ) {
					$(trigger).addClass( 'visible' );
				} else {
					$(trigger).removeClass( 'visible' );
				}
			} );
			$(trigger).on('click', function() {
				$(target).stop().animate({scrollTop: 0}, 1200, 'easeOutExpo');
			});
		}
	}
	scrollBackTop('.scroll-to-top-btn', 'html, body');


	// Range Slider
	//------------------------------------------------------------------------------
	function rangeSlider(slider) {
		$(slider).each(function() {
			var self = $(this);
			var rangeSlider = self.find('.ui-range-slider');
			var options = {
					dataStartMin: parseInt(rangeSlider.parent().data( 'start-min' ), 10),
					dataStartMax: parseInt(rangeSlider.parent().data( 'start-max' ), 10),
					dataMin: parseInt(rangeSlider.parent().data( 'min' ), 10),
					dataMax: parseInt(rangeSlider.parent().data( 'max' ), 10),
					dataStep: parseInt(rangeSlider.parent().data( 'step' ), 10),
					valueMin: self.find('.ui-range-value-min span'),
					valueMax: self.find('.ui-range-value-max span'),
					valueMinInput: self.find('.ui-range-value-min input'),
					valueMaxInput: self.find('.ui-range-value-max input')
			}
			
			noUiSlider.create(rangeSlider[0], {
				start: [ options.dataStartMin, options.dataStartMax ],
				connect: true,
				step: options.dataStep,
				range: {
					'min': options.dataMin,
					'max': options.dataMax
				}
			});
	
			rangeSlider[0].noUiSlider.on('update', function(values, handle) {
				var value = values[handle];
				if ( handle ) {
					options.valueMax.text(Math.round(value));
					options.valueMaxInput.val(Math.round(value));
				} else {
					options.valueMin.text(Math.round(value));
					options.valueMinInput.val(Math.round(value));
				}
			});
		});
	}
	rangeSlider('.range-slider');
	

	// Parallax Scrolling
	//------------------------------------------------------------------------------
	ParallaxScroll.init();
	

	// Pricing Plans Switch
	//------------------------------------------------------------------------------
	function priceSwitch(toggle) {
		$(toggle + '> li > a').on('click', function(e) {
			var self = $(this),
					period = self.data('period'),
					mainParent = self.parents('.pricing-plans');
			mainParent.find(toggle + '> li > a').removeClass('active');
			self.addClass('active');

			mainParent.find('.pricing-card-price').removeClass('active');
			mainParent.find('.' + period).addClass('active');
			e.preventDefault;
		});
	}
	priceSwitch('.pricing-tabs');
	

	// Google Maps API
	//------------------------------------------------------------------------------
	var $googleMap = $('.google-map');
	if($googleMap.length) {
		$googleMap.each(function() {
			var mapHeight = $(this).data('height'),
					address = $(this).data('address'),
					zoom = $(this).data('zoom'),
					controls = $(this).data('disable-controls'),
					scrollwheel = $(this).data('scrollwheel'),
					marker = $(this).data('marker'),
					markerTitle = $(this).data('marker-title'),
					styles = $(this).data('styles');
			$(this).height(mapHeight);
			$(this).gmap3({
				address: address,
				zoom: zoom,
				disableDefaultUI: controls,
				scrollwheel: scrollwheel,
				styles: styles
			}).marker({
				address: address,
				icon: marker
			}).infowindow({
        content: markerTitle
      }).then(function (infowindow) {
        var map = this.get(0);
        var marker = this.get(1);
        marker.addListener('mouseover', function() {
          infowindow.open(map, marker);
        });
        marker.addListener('mouseout', function() {
          infowindow.close(map, marker);
        });
      });
		});
	}

});/*Document Ready End*/
