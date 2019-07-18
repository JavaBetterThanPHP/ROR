import React from "react";
import { makeStyles } from "@material-ui/core/styles";
import Table from "@material-ui/core/Table";
import TableBody from "@material-ui/core/TableBody";
import TableCell from "@material-ui/core/TableCell";
import TableHead from "@material-ui/core/TableHead";
import TableRow from "@material-ui/core/TableRow";
import Button from "@material-ui/core/Button";
import moment from "moment";

const useStyles = makeStyles(theme => ({
  root: {
    width: "100%",
    marginTop: theme.spacing(3),
    overflowX: "auto"
  },
  table: {
    minWidth: 650,
    marginTop: 48
  }
}));

export default function DashboardPostsTable({ posts = [], handleDelete }) {
  const classes = useStyles();

  return (
    <Table className={classes.table}>
      <TableHead>
        <TableRow>
          <TableCell>Title</TableCell>
          <TableCell align="right">Time to Read</TableCell>
          <TableCell align="right">Score</TableCell>
          <TableCell align="right">Date</TableCell>
          <TableCell align="center">Remove</TableCell>
        </TableRow>
      </TableHead>
      <TableBody>
        {/* IF NO DATA */}
        {posts.length === 0 && (
          <TableRow key="nodata">
            <TableCell colSpan="5">No posts</TableCell>
          </TableRow>
        )}

        {/* DISPLAYING DATA */}
        {posts.map(post => (
          <TableRow key={post.id}>
            <TableCell component="th" scope="row">
              {post.title}
            </TableCell>
            <TableCell align="right">{post.timeToRead}</TableCell>
            <TableCell align="right">{post.score}</TableCell>
            <TableCell align="right">{moment().format("DD-MM-YYYY")}</TableCell>
            <TableCell align="right">
              <Button
                size="small"
                color="secondary"
                onClick={e => handleDelete(e, post.id)}
              >
                X
              </Button>
            </TableCell>
          </TableRow>
        ))}
      </TableBody>
    </Table>
  );
}
