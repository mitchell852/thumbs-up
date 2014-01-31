ThumbsUp = (function () {
    'use strict';

    var api = {},
        $activeThumbs,
        rootPath,
        selectedThumb,
        selectedThumbCarouselContainer,

        // methods
        registerHandlers,
        initializeCarousels,
        hideCarousels,
        initializeBackbone,

        // backbone
        Router;

    registerHandlers = function () {
        $activeThumbs.on('click', function () {
            var selectedThumbIndex;

            selectedThumb = $(this);

            // update the url via backbone
            api.router.navigate(selectedThumb.data('path'), {trigger: false});

            // add / remove up arrow
            $activeThumbs.find('.arrow').addClass('hidden');
            selectedThumb.find('.arrow').removeClass('hidden');

            // add / remove selected class
            $activeThumbs.removeClass('selected');
            selectedThumb.addClass('selected');

            // slide up / down details carousel
            selectedThumbCarouselContainer = selectedThumb.closest('.thumb-row').find('.thumb-carousel-container');

            if (!selectedThumbCarouselContainer.is(':visible')) {
                $('.thumb-carousel-container').slideUp();
                selectedThumbCarouselContainer.slideDown();
            }

            // scroll to the appropriate carousel index
            selectedThumbIndex = $activeThumbs.index(selectedThumb);
            selectedThumbCarouselContainer.find('.rs-carousel').carousel('goToItem', selectedThumbIndex, false);

            // prevent the default behavior of the click event
            return false;
        });

        $('a.close').click(function () {
            selectedThumbCarouselContainer.slideUp(function() {
                $activeThumbs.find('.arrow').addClass('hidden');
                $activeThumbs.removeClass('selected');
            });
            return false;
        });
    };

    initializeCarousels = function () {
        $('.rs-carousel').carousel({
            speed: 700,
            itemsPerPage: 1,
            itemsPerTransition: 1,
            itemWidth: 870,
            containerHeight: 410,
            calculateWidth: true,
            moveNextActionRight: true
        });
        hideCarousels();
    };

    hideCarousels = function () {
        $('.thumb-carousel-container').addClass('hidden');
    };

    initializeBackbone = function () {
        Router = Backbone.Router.extend({
            routes: {
                ':path': 'show'
            },
            show: function(path) {
                $activeThumbs.each(function (i, thumb) {
                    // open the appropriate thumb
                    if ($(thumb).data('path') === path) {
                        $(thumb).trigger('click');
                        return false;
                    }
                });
            },
            start: function () {
                Backbone.history.start({
                    pushState: true,
                    silent: false,
                    root: rootPath
                });
            }
        });

        api.router = new Router();
        api.router.start();
    };

    api.init = function (root) {
        $activeThumbs = $('.thumb[data-active=true]');
        rootPath = $.trim(root) + '/';

        registerHandlers();
        initializeCarousels();
        initializeBackbone();
    };

    return api;
}());

