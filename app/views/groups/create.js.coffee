row = $('#new_groups_link<%=@i%>').closest('.row')
row.html("<%=j render 'groups/one_group'%>") 
row.find('.selectpicker').selectpicker()
row.find('.selectpicker[data-value]').each ->
  $(this).selectpicker 'val', $(this).data('value')
  false
$('#new_field').html("") 
