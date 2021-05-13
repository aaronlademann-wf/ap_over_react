// 11: The provider pattern
// Extra credit: avoid unecessary re-renders by only updating the value when
// state changes

import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';
import 'package:ap_over_react/src/exercises-final/11/extra/2/context.dart';

part 'toggle.over_react.g.dart';

// ignore: undefined_identifier
UiFactory<ToggleProps> Toggle = castUiFactory(_$Toggle);

@Props(keyNamespace: '')
mixin TogglePropsMixin on UiProps {
  /// Callback that returns `state.isOn` when the toggle switches;
  Callback1Arg onToggle;
}

class ToggleProps = UiProps with SharedTogglePropsMixin, TogglePropsMixin;

mixin ToggleState on UiState {
  // Whether the toggle is On or Off
  bool isOn;
  Callback1Arg toggle;
}

class ToggleComponent extends UiStatefulComponent2<ToggleProps, ToggleState> {
  @override
  get initialState => (newState()
    ..isOn = false
    ..toggle = toggle
  );

  void toggle(_) {
    setState(
      newState()..isOn = !state.isOn,
      () => props.onToggle(state.isOn),
    );
  }

  @override
  render() {
    return (ToggleContext.Provider()
      ..value = (SharedTogglePropsMapView()
        ..isOn = state.isOn
        ..toggle = state.toggle)
    )(props.children);
  }
}
