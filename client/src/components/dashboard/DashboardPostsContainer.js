import React from "react";
import { connect } from "react-redux";
import { getLoggedUser, updateState } from "../../redux/actions/account";
import "react-draft-wysiwyg/dist/react-draft-wysiwyg.css";
import DashboardPostsTable from "./DashboardPostsTable";
import { removeAPost } from "../../redux/actions/posts";

class DashboardPostsContainer extends React.Component {
  componentWillMount() {
    this.props.getLoggedUser();
  }

  onDelete = (event, id) => {
    this.props.account.user.posts = this.props.account.user.posts.filter(e => {
      return e.id !== id;
    });
    this.props.updateState(this.props.account.user);
    this.props.removePost(id);
  };

  render() {
    return (
      <>
        <DashboardPostsTable
          posts={this.props.account.user.posts}
          handleDelete={this.onDelete}
        />
      </>
    );
  }
}

const mapStateToProps = state => ({
  auth: state.auth,
  account: state.account
});

const mapActionToProps = dispatch => ({
  getLoggedUser: () => dispatch(getLoggedUser(dispatch)),
  removePost: id => dispatch(removeAPost(id, dispatch)),
  updateState: user => dispatch(updateState(user))
});

export default connect(
  mapStateToProps,
  mapActionToProps
)(DashboardPostsContainer);
