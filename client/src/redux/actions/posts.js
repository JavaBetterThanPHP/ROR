const jwtDecoder = require("jwt-decode");
const BASE_URL = "http://localhost:3000/api/v1";

// POST /posts
// ------------------------------------------
export function postAPost(post, dispatch) {
  const TOKEN = window.localStorage.getItem("token");
  const DECODED_TOKEN = TOKEN ? jwtDecoder(TOKEN) : "";

  fetch(BASE_URL + "/posts", {
    method: "POST",
    headers: {
      Authorization: "Bearer " + TOKEN,
      "Content-Type": "application/json"
    },
    mode: "cors",
    body: JSON.stringify({ ...post, user: { id: DECODED_TOKEN.user_id } })
  })
    .then(response => {
      if (response.status === 200) {
        return response.json();
      } else {
        return response.json();
      }
    })
    .then(data => {
      dispatch({
        type: "APP_POST_NEW_POST_SUCCEED",
        payload: {
          post: data.post,
          status: "Published !"
        }
      });
    })
    .catch(e => {
      console.error(e);
      dispatch({
        type: "APP_POST_NEW_POST_FAILED",
        payload: {
          err: e.error ? e.error : e,
          status: "Error during the save of the post"
        }
      });
    });

  return {
    type: "APP_POST_NEW_POST_REQUESTED"
  };
}

// Reset status
// ------------------------------------------
export function resetStatus() {
  return {
    type: "APP_POST_STATUS_NEW_POST_RESET"
  };
}

// GET /posts
// ------------------------------------------
export function getAllPosts(dispatch) {
  const TOKEN = window.localStorage.getItem("token");

  fetch(BASE_URL + "/posts", {
    method: "GET",
    headers: {
      Authorization: "Bearer " + TOKEN,
      "Content-Type": "application/json"
    },
    mode: "cors"
  })
    .then(response => {
      if (response.status === 200) {
        return response.json();
      } else {
        return response.json();
      }
    })
    .then(data => {
      dispatch({
        type: "APP_GET_ALL_POST_SUCCEED",
        payload: {
          posts: data,
          status: "Retrieving succeed."
        }
      });
    })
    .catch(e => {
      console.error(e);
      dispatch({
        type: "APP_GET_ALL_POST_FAILED",
        payload: {
          err: e.error ? e.error : e,
          status: "Retrieving failed."
        }
      });
    });

  return {
    type: "APP_GET_ALL_POST_REQUESTED"
  };
}

// GET /posts/:id
// ------------------------------------------
export function getOnePost(postId, dispatch) {
  const TOKEN = window.localStorage.getItem("token");

  fetch(BASE_URL + "/posts/" + postId, {
    method: "GET",
    headers: {
      Authorization: "Bearer " + TOKEN,
      "Content-Type": "application/json"
    },
    mode: "cors"
  })
    .then(response => {
      if (response.status === 200) {
        return response.json();
      } else {
        return response.json();
      }
    })
    .then(data => {
      dispatch({
        type: "APP_GET_ONE_POST_SUCCEED",
        payload: {
          post: data,
          status: "Retrieving succeed."
        }
      });
    })
    .catch(e => {
      console.error(e);
      dispatch({
        type: "APP_GET_ONE_POST_FAILED",
        payload: {
          err: e.error ? e.error : e,
          status: "Retrieving failed."
        }
      });
    });

  return {
    type: "APP_GET_ONE_POST_REQUESTED"
  };
}

// DELETE /posts
// ------------------------------------------
export function removeAPost(postID, dispatch) {
  const TOKEN = window.localStorage.getItem("token");

  fetch(BASE_URL + "/posts/" + postID, {
    method: "DELETE",
    headers: {
      Authorization: "Bearer " + TOKEN,
      "Content-Type": "application/json"
    },
    mode: "cors"
  })
    .then(response => {
      if (response.status === 204) {
        dispatch({
          type: "APP_REMOVE_POST_SUCCEED"
        });
      } else {
        return new Promise("Erreur");
      }
    })
    .catch(e => {
      dispatch({
        type: "APP_REMOVE_POST_FAILED"
      });
    });

  return {
    type: "APP_REMOVE_POST_REQUESTED"
  };
}

// POST /favorite_posts
// ------------------------------------------
export function likeAPost(post, dispatch) {
  const TOKEN = window.localStorage.getItem("token");

  fetch(BASE_URL + "/favorite_posts", {
    method: "POST",
    headers: {
      Authorization: "Bearer " + TOKEN,
      "Content-Type": "application/json"
    },
    mode: "cors",
    body: JSON.stringify({ post_id: post.id })
  })
    .then(response => {
      if (response.status === 201) {
        return response.json();
      } else {
        return new Promise("Erreur");
      }
    })
    .then(data => {
      dispatch({
        type: "APP_LIKE_POST_SUCCEED"
      });
    })
    .catch(e => {
      console.error(e);
      dispatch({
        type: "APP_LIKE_POST_FAILED"
      });
    });

  return {
    type: "APP_LIKE_POST_REQUESTED"
  };
}

// DELETE /favorite_posts/:id
// ------------------------------------------
export function unlikeAPost(post, dispatch) {
  const TOKEN = window.localStorage.getItem("token");

  fetch(BASE_URL + "/favorite_posts/" + post.id, {
    method: "DELETE",
    headers: {
      Authorization: "Bearer " + TOKEN,
      "Content-Type": "application/json"
    },
    mode: "cors"
  })
    .then(response => {
      if (response.status === 204) {
        dispatch({
          type: "APP_UNLIKE_POST_SUCCEED"
        });
      } else {
        return new Promise("Erreur");
      }
    })
    .catch(e => {
      console.error(e);
      dispatch({
        type: "APP_UNLIKE_POST_FAILED"
      });
    });

  return {
    type: "APP_UNLIKE_POST_REQUESTED"
  };
}

// POST /bookmark_posts
// ------------------------------------------
export function bookmarkAPost(post, dispatch) {
  const TOKEN = window.localStorage.getItem("token");

  fetch(BASE_URL + "/bookmark_posts", {
    method: "POST",
    headers: {
      Authorization: "Bearer " + TOKEN,
      "Content-Type": "application/json"
    },
    body: JSON.stringify({ post_id: post.id }),
    mode: "cors"
  })
    .then(response => {
      if (response.status === 201) {
        return response.json();
      } else {
        return new Promise("Erreur");
      }
    })
    .then(data => {
      dispatch({
        type: "APP_BOOKMARK_POST_SUCCEED"
      });
    })
    .catch(e => {
      console.error(e);
      dispatch({
        type: "APP_BOOKMARK_POST_FAILED"
      });
    });

  return {
    type: "APP_BOOKMARK_POST_REQUESTED"
  };
}

// DELETE /bookmark_posts/:id
// ------------------------------------------
export function unbookmarkAPost(post, dispatch) {
  const TOKEN = window.localStorage.getItem("token");

  fetch(BASE_URL + "/bookmark_posts/" + post.id, {
    method: "DELETE",
    headers: {
      Authorization: "Bearer " + TOKEN,
      "Content-Type": "application/json"
    },
    mode: "cors"
  })
    .then(response => {
      if (response.status === 204) {
        dispatch({
          type: "APP_UNBOOKMARK_POST_SUCCEED"
        });
      } else {
        return new Promise("Erreur");
      }
    })
    .catch(e => {
      console.error(e);
      dispatch({
        type: "APP_UNBOOKMARK_POST_FAILED"
      });
    });

  return {
    type: "APP_UNBOOKMARK_POST_REQUESTED"
  };
}
