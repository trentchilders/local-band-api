(function() {
  "use strict";
 
  angular.module("app").controller("bandsCtrl", function($scope, $http) {

    $scope.setup = function() {
      $http.get("/api/v1/bands.json").then(function(response) {
        $scope.bands = response.data;
      });
    }

    $scope.addBand = function(name, email, number_members) {
      var band = {
        name: name,
        email: email,
        number_members: number_members
      };
    
      $http.post('/api/v1/bands.json', band).then(function(response){
          $scope.bands.push(band);
      }, function(error) {
        $scope.errors = error.data.errors;
      });

    };

    $scope.toggleOrder = function(attribute) {
      $scope.orderAttribute = attribute;
      $scope.descending = !$scope.descending;
    };

  });

}());
