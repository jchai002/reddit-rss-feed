var Feed = React.createClass({
  getInitialState: function(){
    return {
      deleted: false
    }
  },
  render: function() {
    if (!this.state.deleted) {
      return <li key={this.props.id}>
        <div className="card">
          <div className="content">
            <a href={'/feeds/' + this.props.id}>
              <span className="title">{this.props.query}</span>
            </a>
            <br/>
          </div>

          <div classNameName="action">
            <div classNameName="row">
              <div className="columns small-12">

                <a href={'/feeds/' + this.props.id + '/edit'} className="button tiny round">
                  <i className="fi-pencil"></i> Edit
                </a>

                <button  onClick={this.handleDeleteClick} className="button tiny round alert">
                  <i className="fi-x"></i> Delete
                </button>

              </div>
            </div>
          </div>
        </div>
      </li>
    } else {
      return <div></div>
    }

  },
  handleDeleteClick: function(){
        var url='/feeds/'+this.props.id
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
