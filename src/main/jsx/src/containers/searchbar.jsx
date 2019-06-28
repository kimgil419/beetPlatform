import React, {Component} from 'react';

export default class SearchBar extends Component {

  state = {
    term: "",
  }

  onInputChange = (e) => {
    this.setState({term: e.target.value})
    this.props.onSearchKeyword(this.state.term);
  }



  render(){

    return(
      <div>
      <input value={this.state.term} onChange={this.onInputChange}/>
      {this.state.term}
      </div>

    )
  }
}
