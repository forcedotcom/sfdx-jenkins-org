angular.module('starter', ['ionic'])

    .config(function($stateProvider) {

        $stateProvider
            .state('contactlist', {
                url: '',
                templateUrl: '/apex/IonicContactsList_Tpl',
                controller : "ContactListCtrl"
            })

    })

    .controller('ContactListCtrl', function($scope) {

        var contactsRemote = new SObjectModel.Contact();
            
        contactsRemote.retrieve({ limit: 10 }, function(err, records, event){
            if (err) {
                alert(err.message);
            } else {
                var contacts = [];
                for (var i = 0; i < records.length; i++) {
                    var contact = records[i];
                    contacts.push({id: contact.get("Id"), name: contact.get("Name"), title: contact.get("Title")});
                }
                $scope.$apply(function() {
                    $scope.contacts = contacts;
                });
            }
        });
        
    })