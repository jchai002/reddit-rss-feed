function ajaxDelete(url, component){
  $.ajax({
    url: url,
    type: 'DELETE',
    success: function(result) {
      component.setState({
        deleted:true
      })
    },
    error: function(xhr, status, err) {
      console.error( status, err.toString());
    }
  })
}
