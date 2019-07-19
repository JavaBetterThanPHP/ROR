import React from "react";
import { connect } from "react-redux";
import {
  getOnePost,
  likeAPost,
  unlikeAPost,
  bookmarkAPost,
  unbookmarkAPost
} from "../../redux/actions/posts";
import { Typography } from "@material-ui/core";
import PostDetailComponent from "./PostDetailComponent";
import { updateLoggedUser, updateState } from "../../redux/actions/account";

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
      this.props.bookmark(this.props.posts.post);
      this.props.account.user.bookmarks.push(this.props.posts.post);
      this.props.updateState(this.props.account.user);
    } else {
      this.props.unbookmark(this.props.posts.post);
      this.props.account.user.bookmarks = this.props.account.user.bookmarks.filter(
        e => {
          return e.id !== this.props.posts.post.id;
        }
      );
      this.props.updateState(this.props.account.user);
    }
  };

  // Handle btn favorite
  handleFavorite = () => {
    if (!this.isFavorite(this.props.posts.post)) {
      this.props.like(this.props.posts.post);
      this.props.account.user.favorites.push(this.props.posts.post);
      this.props.updateState(this.props.account.user);
    } else {
      this.props.unlike(this.props.posts.post);
      this.props.account.user.favorites = this.props.account.user.favorites.filter(
        e => {
          return e.id !== this.props.posts.post.id;
        }
      );
      this.props.updateState(this.props.account.user);
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
  updateState: user => dispatch(updateState(user, dispatch)),
  like: post => dispatch(likeAPost(post, dispatch)),
  unlike: post => dispatch(unlikeAPost(post, dispatch)),
  bookmark: post => dispatch(bookmarkAPost(post, dispatch)),
  unbookmark: post => dispatch(unbookmarkAPost(post, dispatch))
});

export default connect(
  mapStateToProps,
  mapActionToProps
)(PostDetailContainer);
