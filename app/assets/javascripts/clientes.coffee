$(document).ready ->
  $('.cpf').mask '999.999.999-99', placeholder: ' '
  $('.rg').mask '99.999.999-99', placeholder: ' '
  $('.telefone').mask '(99) 99999-9999', placeholder: ' '
  $('.cep').mask '99999-999', placeholder: ' '
  $('.moeda').mask '###.###.##0,00', reverse: true
  $('#qtd_filhos').hide()
  $('#cliente_tem_filhos_true').change ->
    if $(this).is(':checked')
      $('#qtd_filhos').show()
    else
      $('#qtd_filhos').hide()
    return
  $('#cliente_tem_filhos_false').change ->
    if $(this).is(':checked')
      $('#qtd_filhos').hide()
    else
      $('#qtd_filhos').show()
    return
  return

# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
clienteCenter = angular.module('clienteCenter', [ 'ngResource' ])
clienteCenter.factory 'Api', [
  '$resource'
  ($resource) ->
    {
      Cliente: $resource '/verifica_cpf', {},
        index:
          method: 'GET'
          isArray: true
          responseType: 'json'
        update:
          method: 'PUT'
          responseType: 'json'
    }
]
clienteCenter.controller 'ClientesController', [
  '$scope'
  'Api'
  ($scope, Api) ->

    $scope.verifica_success = ->
      if $scope.cliente.length > 0
        showHref = $('#showCliente').attr('href')
        $('#showCliente').attr 'href', showHref +  $scope.cliente[0].actable_id
        editHref = $('#editCliente').attr('href')
        $('#editCliente').attr 'href', editHref + $scope.cliente[0].actable_id + "/edit"

        $('#MyModal').modal()

      return
    $scope.verifica_fail = ->
      # Growlyflash.error("Ocorreu um erro ao tentar verifica a propota. Por favor, tente novamente mais tarde.")
      return
    $scope.verifica = () ->
      $scope.cliente = Api.Cliente.index({cpf: $scope.cpf.replace(/\D/g, "")},$scope.cpf.replace(/\D/g, ""),$scope.verifica_success,$scope.verifica_fail)
    return
]
