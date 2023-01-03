import * as React from 'react';

import { StyleSheet, View } from 'react-native';
import { JsiMapsView } from 'react-native-jsi-maps';

export default function App() {
  return (
    <View style={styles.container}>
      <JsiMapsView color="#32a852" style={styles.box} onMapLoadEnd={() => alert('Works!')}/>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    alignItems: 'center',
    justifyContent: 'center',
  },
  box: {
    flex: 1,
    width: '100%',
  },
});
