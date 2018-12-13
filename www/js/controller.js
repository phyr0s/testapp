(function() {
    'use strict';

    angular
        .module('starter')
        .controller('MainController', MainController);

    /* @ngInject */
    function MainController($scope) {
        $scope.openApp = openApp;
        function openApp() {
            var a = new cordova.plugins.openApp();
            a.open();
        }
    }
})();
