angular.module('cobudget').controller('ApplicationController',
  function ($scope, $state, AuthService, AUTH_EVENTS, Restangular) {
    $scope.currentUser = null;

    $scope.updateCurrentUser = function () {
      $scope.currentUser = AuthService.getCurrentUser();
      $scope.updateCurrentUserHeaders()
    }

    $scope.updateCurrentUserHeaders = function () {
      var token, email;
      if ($scope.currentUser) {
        token = $scope.currentUser.authentication_token;
        email = $scope.currentUser.email
      }
      Restangular.setDefaultHeaders({
        "Accept": "application/json",
        "X-User-Token": token,
        "X-User-Email": email
      })
    };

    $scope.$on(AUTH_EVENTS.loginSuccess, function () {
      $scope.updateCurrentUser();
      $state.go('nav.budget', {groupId: 1});
    });

    $scope.$on(AUTH_EVENTS.logoutSuccess, function () {
      $scope.updateCurrentUser();
    });

    $scope.updateCurrentUser();
  })