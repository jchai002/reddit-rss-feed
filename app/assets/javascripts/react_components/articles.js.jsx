var Articles = React.createClass({
  render: function() {
    var articles = this.props.data.map(function(articles){
      return <Article {...articles} />
    });

    return <div key={this.props.id}>
        {articles}
      </div>
  },
})
