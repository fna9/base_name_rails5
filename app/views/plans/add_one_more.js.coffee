row = $('#one_more_<%= @object %>').closest('.row')
row.before("<div class = 'row'><%=j render "#{@object}s/one_#{@object}"%></div>") 
row.prev().find('.selectpicker').selectpicker()
row.prev().find('.selectpicker[data-value]').each ->
  $(this).selectpicker 'val', $(this).data('value')
  false
$('#one_more_<%= @object %>').attr('href', "<%=j add_one_more_plans_path(i: @i + 1, object: @object) %>")
