import React from "react";
import { connect } from "react-redux";
import { Formik, Form } from "formik";
import TextField from "@material-ui/core/TextField";
import { Button } from "@material-ui/core";
import { updateLoggedUser } from "../../redux/actions/account";
import moment from "moment";

class AccountFormContainer extends React.Component {
  render() {
    return (
      <>
        {this.props.account.loaded === true && (
          <Formik
            enableReinitialize
            initialValues={{
              email: "",
              description: "",
              ...this.props.account.user,
              firstname: this.props.account.user.firstname
                ? this.props.account.user.firstname
                : "",
              lastname: this.props.account.user.lastname
                ? this.props.account.user.lastname
                : "",
              birthdate: this.props.account.user.birthdate
                ? this.props.account.user.birthdate
                : moment().format("YYYY-MM-DD")
            }}
            onSubmit={(values, actions) => {
              this.props.updateLoggedUser(values);
              actions.setSubmitting(false);
            }}
            render={({ values, handleChange, handleBlur, isSubmitting }) => (
              <Form autoComplete="off">
                <TextField
                  id="email"
                  name="email"
                  type="text"
                  disabled={true}
                  autoComplete="false"
                  onChange={handleChange}
                  onBlur={handleBlur}
                  value={values.email}
                  label="Email"
                  margin="normal"
                  fullWidth
                />
                <br />

                <TextField
                  id="firstname"
                  name="firstname"
                  type="text"
                  autoComplete="false"
                  onChange={handleChange}
                  onBlur={handleBlur}
                  value={values.firstname}
                  label="Firstname"
                  margin="normal"
                  fullWidth
                />
                <br />

                <TextField
                  id="lastname"
                  name="lastname"
                  type="text"
                  autoComplete="false"
                  onChange={handleChange}
                  onBlur={handleBlur}
                  value={values.lastname}
                  label="Lastname"
                  margin="normal"
                  fullWidth
                />
                <br />

                <TextField
                  id="birthdate"
                  name="birthdate"
                  type="date"
                  onChange={handleChange}
                  onBlur={handleBlur}
                  label="Birthdate"
                  defaultValue={moment(values.birthdate).format("YYYY-MM-DD")}
                  margin="normal"
                  InputLabelProps={{
                    shrink: true
                  }}
                  fullWidth
                />
                <br />

                <TextField
                  id="description"
                  name="description"
                  type="text"
                  autoComplete="false"
                  onChange={handleChange}
                  onBlur={handleBlur}
                  value={values.description}
                  label="Description"
                  margin="normal"
                  fullWidth
                />
                <br />

                <Button
                  variant="outlined"
                  color="secondary"
                  type="submit"
                  size="small"
                  disabled={isSubmitting}
                  style={{ marginTop: 20 }}
                >
                  Submit
                </Button>
              </Form>
            )}
          />
        )}
      </>
    );
  }
}

const mapStateToProps = state => ({
  auth: state.auth,
  account: state.account
});

const mapActionToProps = dispatch => ({
  updateLoggedUser: user => dispatch(updateLoggedUser(user, dispatch))
});

export default connect(
  mapStateToProps,
  mapActionToProps
)(AccountFormContainer);
