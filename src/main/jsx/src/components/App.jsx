import React, {Component} from "react";
import SearchBar from "../containers/searchbar";
import EmployeeList from './employeelist';

export default class App extends Component {

  state = {
    list: "",
    keyword: ""
  }

  componentDidMount() {

  var targetUrl= "http:///localhost:9999/reacttest.do";

    fetch(targetUrl)
        .then(response => response.json())
        .then(e =>this.setState({list:e})
      );
  }

  onSearchKeyword = (e) => {
    this.setState({keyword: e})
  }


  render() {
    const list = this.state.list;
    console.log(list);

    return (
      <div>
      <SearchBar onChange={this.onSearchKeyword}/>
      <EmployeeList/>
      </div>
    )
 }
}
