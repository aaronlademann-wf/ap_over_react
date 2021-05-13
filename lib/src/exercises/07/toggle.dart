// 07: State Initializers

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';

part 'toggle.over_react.g.dart';

// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = castUiFactory(_$Toggle);

@Props(keyNamespace: '')
mixin TogglePropsMixin on UiProps {
  bool initialOn;

  /// Callback that returns `state.isOn` when the toggle switches;
  Callback1Arg onToggle;
  Callback1Arg onToggleReset;
}

class ToggleProps = UiProps with SharedTogglePropsMixin, TogglePropsMixin;

mixin ToggleState on UiState {
  // 🐨 We're going to need some static defaultProps here to allow
  // people to pass a `initialOn` prop.
  bool isOn;
}

class ToggleComponent extends UiStatefulComponent2<ToggleProps, ToggleState> {
  // 🐨 Rather than initializing state to have on as false,
  // set on to this.props.initialOn
  @override
  get initialState => (newState()..isOn = false);

  // 🐨 now let's add a reset method here that resets the state
  // to the initial state. Then add a callback that calls
  // this.props.onReset with the `on` state.
  void toggle() {
    setState(
      newState()..isOn = !state.isOn,
      () => props.onToggle(state.isOn),
    );
  }

  SharedTogglePropsMapView getTogglerProps([SharedTogglePropsMapView additionalProps]) {
    additionalProps ??= SharedTogglePropsMapView();

    return SharedTogglePropsMapView()
      ..addAll(additionalProps)
      ..aria.pressed = state.isOn
      ..onClick = mouseEventCallbacks.chainFromList([additionalProps.onClick, (_) => toggle()]);
  }

  SharedTogglePropsMapView getStateAndHelpers() {
    return SharedTogglePropsMapView()
      ..isOn = state.isOn
      ..toggle = toggle
      // 🐨 now let's include the reset method here
      // so folks can use that in their implementation.
      ..getTogglerProps = getTogglerProps;
  }

  @override
  render() {
    return props.children.single(getStateAndHelpers());
  }
}
