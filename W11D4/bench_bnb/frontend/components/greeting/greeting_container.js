import Greeting from './greeting';
import { deleteSession,
          } from '../../actions/session';
import { connect } from 'react-redux';

const mapStateToProps = (state) => ({
  user: state.entities.users[state.session.id],
});

const mapDispatchToProps = (dispatch) => ({
  signup: () => dispatch(postUser()),
  login:  () => dispatch(postSession()),
  logout: () => dispatch(deleteSession())
})

export default connect(mapStateToProps,mapDispatchToProps)(Greeting);