expect = require('../support/expect')
sinon = require('sinon')

require '../support/setup'
require '../../app/scripts/services/budget_loader'

$scope = {}
$rootScope = {}

budget_loader = new window.Cobudget.Services.BudgetLoader()
budget_loader.init($scope, $rootScope)
Budget = {
  myBudgets: sinon.stub()
  allBudgets: ->
    then: (callback) ->
      callback(Budget.myBudgets())
}

describe 'BudgetLoader', ->
  beforeEach ->
    budget_loader.rootScope.currentBudget = undefined
    budget_loader.scope.currentBudgetId = undefined

  describe 'loadFromRootScope', ->
  	it 'defaults $scope.currentBudgetId to ""', ->
  		budget_loader.loadFromRootScope()
  		expect(budget_loader.scope.currentBudgetId).to.eq('')

  	it 'sets the scope of the currentBudgetId', ->
			budget_loader.rootScope.currentBudget = {id: 5}
			budget_loader.loadFromRootScope()
			expect(budget_loader.scope.currentBudgetId).to.eq(5)

  describe 'defaultToFirstBudget', ->
    it 'does nothing if scope.budgets empty'
    it 'sets rootScope.currentBudget to the first budget'
    it 'sets scope.currentbudgetId to the budget id'

  describe 'setBudget', ->
    it 'sets rootScope.currentBudget to the first budget with matching id'



