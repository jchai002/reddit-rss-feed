var Article = React.createClass({
  getInitialState: function(){
    return {
      message:'',
      favorited:false
    }
  },
  render: function() {
    return <div key={this.props.id} className="post-wrapper">
      <a href={this.props.link}>{this.props.title}</a>
      <br/>
      <span className="date">{this.props.date}</span>
      <hr/>
      <button  onClick={this.handleFavoriteClick} className="button tiny round"><i className="fi-heart"></i> Favorite</button>
      <br/>
      <span>{this.state.message}</span>
    </div>
  },
  handleFavoriteClick: function(){
    if (this.state.favorited){
        this.setState({message:"You can't favorite something twice, too much of a good thing is bad!"})
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
    },
    componentDidUpdate: function(){
      console.log(this.state)
      this.render()
    },
    componentDidMount: function(){
      console.log(this.state)
    }
})
