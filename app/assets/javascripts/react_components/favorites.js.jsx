var Favorites = React.createClass({
  getInitialState: function(){
    return {
      message:''
    }
  },
  render: function() {
    var favorites = this.props.data.map(function(favorite){
      return <Favorite key={favorite.id} data={favorite}  />
    });
    return <div key={this.props.id}>
        <span style={{color:'red'}}>{this.state.message}</span>
        {favorites}
      </div>
    }
})
