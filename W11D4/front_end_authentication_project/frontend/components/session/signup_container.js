import { connect }       from 'react-redux';
import { createNewUser } from '../../actions/session';
import Signup            from './signup';

const mapDispatchToProps = dispatch => ({
  createNewUser: formUser => dispatch(createNewUser(formUser))
});

// we dont have mapStateToProps so we use null there
export default connect(null, mapDispatchToProps)(Signup);
