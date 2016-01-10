var Favorite = React.createClass({
  getInitialState: function(){
    return {
      deleted:false
    }
  },
  render: function() {
    if (!this.state.deleted){
      return <div key={this.props.data.id} className="post-wrapper">
        <a href={this.props.data.link}>{this.props.data.title}</a>
        <br/>
        <span className="radius secondary label">{moment(this.props.data.date).fromNow()}</span>
        <hr/>
        <button onClick={this.handleDeleteClick} className="button tiny round alert"><i className="fi-x"></i> Delete</button>
        <br/>
      </div>
    } else {
      return <div></div>
    }

  },
  handleDeleteClick: function(){
        var url='/favorites/'+this.props.data.id
        ajaxDelete(url, this);
    }
})
