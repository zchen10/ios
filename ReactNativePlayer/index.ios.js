/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 */
'use strict';

var React = require('react-native');
var {
  AppRegistry,
  StyleSheet,
  Text,
  View,
  TouchableHighlight,
  DeviceEventEmitter
} = React;

var eventBridge = require('NativeModules').NativeEventBridge;

var AwesomeProject = React.createClass({
  getInitialState() {
    return {playhead:"0", duration:"0"};
  },

  handlePress() { 
	 eventBridge.onPress('TogglePlayPause');
  }, 

  update(e) {
    console.log("update received");
    this.setState({playhead:e.playhead, duration:e.duration});
  },

  componentWillMount: function() {
    console.log("componentWillMount");
    var subscription = DeviceEventEmitter.addListener(
      'ppp', 
      (reminder) => this.update(reminder)
    );
  },

  componentWillUnmount: function() {
    subscription.remove;
  },

  render: function() {
    console.log("render gets called");
    return (
      <View style={styles.container}>
        <Text style={styles.welcome}>{this.state.playhead}:{this.state.duration}</Text>
        <TouchableHighlight
          onPress={this.handlePress}
          underlayColor="transparent"
          activeOpacity={0.5}>
          <View style={styles.button}>
            <Text style={styles.buttonText}>PRESS</Text>
          </View>
        </TouchableHighlight>
      </View>
    );
  }
});

var styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#00FFFF',
  },
  welcome: {
    fontSize: 20,
    textAlign: 'center',
    margin: 10,
  },
  instructions: {
    textAlign: 'center',
    color: '#333333',
  },
  button: {
    backgroundColor: '#887766',
    padding: 20,
    borderRadius: 5,
  },
  buttonText: {
    color: 'white',
    fontSize: 20,
    fontFamily: 'AvenirNext-DemiBold',
  },
});

AppRegistry.registerComponent('AwesomeProject', () => AwesomeProject);
