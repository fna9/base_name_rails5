row = $('#new_subjects_link<%=@i%>').closest('.row')
row.html("<%=j render 'subjects/one_subject'%>") 
row.find('.selectpicker').selectpicker()
row.find('.selectpicker[data-value]').each ->
  $(this).selectpicker 'val', $(this).data('value')
  false
$('#new_field').html("") 
