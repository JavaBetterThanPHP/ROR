import React from "react";
import { connect } from "react-redux";
import { getOnePost, likeAPost, unlikeAPost } from "../../redux/actions/posts";
import { Typography } from "@material-ui/core";
import PostDetailComponent from "./PostDetailComponent";
import { updateLoggedUser } from "../../redux/actions/account";

class PostDetailContainer extends React.Component {
  componentWillMount() {
    this.props.getOnePost(this.props.postId);
  }

  handleChange = (event, newValue) => {
    this.setState({ ...this.state, activeTab: newValue });
  };

  // Handle btn to bookmark
  handleSaveToBookmarks = () => {
    if (!this.isBookmarked(this.props.posts.post)) {
      // Push into bookmarks
    } else {
      // Remove from bookmarks
    }
  };

  // Handle btn favorite
  handleFavorite = () => {
    if (!this.isFavorite(this.props.posts.post)) {
      // Push into favorites
    } else {
      // Remove from favorites
    }
  };

  // Check if already bookmarked
  isBookmarked = post => {
    return (
      this.props.account.user.bookmarks.filter(element => {
        return post.id === element.id;
      }).length > 0
    );
  };

  // Check if already in favorites
  isFavorite = post => {
    return (
      this.props.account.user.favorites.filter(element => {
        return post.id === element.id;
      }).length > 0
    );
  };

  // render
  render() {
    return (
      <>
        {/* Post */}
        {this.props.posts.postLoaded && (
          <PostDetailComponent
            post={this.props.posts.post}
            bookmarked={this.isBookmarked(this.props.posts.post)}
            liked={this.isFavorite(this.props.posts.post)}
            handleSaveToBookmarks={this.handleSaveToBookmarks}
            handleFavorite={this.handleFavorite}
          />
        )}

        {/* Loading */}
        {!this.props.posts.postLoaded && (
          <Typography
            variant="subtitle1"
            style={{ textAlign: "center", marginTop: 50 }}
          >
            Loading...
          </Typography>
        )}
      </>
    );
  }
}

const mapStateToProps = state => ({
  auth: state.auth,
  posts: state.posts,
  account: state.account
});

const mapActionToProps = dispatch => ({
  getOnePost: postId => dispatch(getOnePost(postId, dispatch)),
  updateUser: user => dispatch(updateLoggedUser(user, dispatch)),
  putALike: post => dispatch(likeAPost(post, dispatch)),
  removeALike: post => dispatch(unlikeAPost(post, dispatch))
});

export default connect(
  mapStateToProps,
  mapActionToProps
)(PostDetailContainer);
