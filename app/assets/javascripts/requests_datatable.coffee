$(document).on 'turbolinks:load', ->
  $('#requests-datatable').DataTable({
    processing: true,
    serverSide: true,
    responsive: true,
    ajax: $('.datatable').data('ajax'),
    columnDefs: [{className: "text-right", orderable: false, targets: -1 }],
    dom: "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
    pagingType: "full_numbers"
  })
