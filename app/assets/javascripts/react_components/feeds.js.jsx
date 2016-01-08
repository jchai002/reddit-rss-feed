var Feeds = React.createClass({
  render: function() {
    var feeds = this.props.data.map(function(feeds){
      return <Feed {...feeds} />
    });

    return <ul className="small-block-grid-3" key={this.props.id}>
        {feeds}
      </ul>
  },
})
