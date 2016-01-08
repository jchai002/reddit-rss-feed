var Feed = React.createClass({

  render: function() {
    return <li key={this.props.id}>
      <div className="card">
        <div className="content">
          <span className="title">{this.props.query}</span>
          <br/>
        </div>

        <div classNameName="action">
          <div classNameName="row">
            <div className="columns small-12">
              <a href={'/feeds/' + this.props.id} className="button tiny round">
                <i className="fi-link"></i>
              </a>

              <a href={'/feeds/' + this.props.id + '/edit'} className="button tiny round">
                <i className="fi-pencil"></i>
              </a>

            </div>
          </div>
        </div>
      </div>
    </li>
  }
})
