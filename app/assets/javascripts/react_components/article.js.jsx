var Article = React.createClass({
  getInitialState: function(){
    return {
      message:'',
      error:'',
      favorited:false
    }
  },
  render: function() {
    return <div key={this.props.id} className="post-wrapper">
      <a href={this.props.link}>{this.props.title}</a>
      <br/>
      <span className="radius secondary label">{moment(this.props.date).fromNow()}</span>
      <hr/>
      <button  onClick={this.handleFavoriteClick} className="button tiny round"><i className="fi-heart"></i> Favorite</button>
      <br/>
      <span style={{color:'green'}}>{this.state.message}</span>
      <span style={{color:'red'}}>{this.state.error}</span>
    </div>
  },
  handleFavoriteClick: function(){
    if (this.state.favorited){
        this.setState({
          message:'',
          error:"Yo Dawg, you just favorited this!"
        })
    } else {
      var data = {
        favorite: this.props
      }
      $.ajax({
      url: "/favorites",
      dataType: 'json',
      type: 'POST',
      data: data,
      success: function(data) {
        this.setState(data)
        this.setState({favorited:true})
      }.bind(this),
      error: function(xhr, status, err) {
        console.error( status, err.toString());
      }.bind(this)
    });
    }
  }
})
