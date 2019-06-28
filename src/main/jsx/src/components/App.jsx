import React, {Component} from "react";
import SearchBar from "../containers/searchbar";
import EmployeeList from './employeelist';

export default class App extends Component {

  state = {
    list: ""
  }

  componentDidMount() {

  var targetUrl= "http:///localhost:9999/reacttest.do";

    fetch(targetUrl)
        .then(response => response.json())
        .then(e =>this.setState({list:e})
      );
  }

  sendKeyword = (term) => {
    this.setState({list})
  }

  render() {
    const list = this.state.list;
    console.log(list);

    return (
      <div>
      <SearchBar onSearchKeyword={this.sendKeyword} />
      <EmployeeList/>
      </div>
    )
 }
}
