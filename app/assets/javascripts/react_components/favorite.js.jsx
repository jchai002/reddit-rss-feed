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
        <span className="date">{this.props.data.date}</span>
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
        $.ajax({
        url: url,
        type: 'DELETE',
        success: function(result) {
          this.setState({
            deleted:true
          })
        }.bind(this),
        error: function(xhr, status, err) {
          console.error( status, err.toString());
        }.bind(this)
      })
    }
})
