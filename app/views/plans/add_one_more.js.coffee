row = $('#one_more').closest('.row')
row.before("<div class = 'row'><%=j render 'subjects/one_subject'%></div>") 
row.prev().find('.selectpicker').selectpicker()
row.prev().find('.selectpicker[data-value]').each ->
  $(this).selectpicker 'val', $(this).data('value')
  false
$('#one_more').attr('href', "<%=j add_one_more_plans_path(i: @i + 1) %>")
