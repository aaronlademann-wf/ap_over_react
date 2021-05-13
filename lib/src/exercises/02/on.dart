import 'package:over_react/over_react.dart';
import 'package:ap_over_react/src/shared/shared_props.dart';

part 'on.over_react.g.dart';

@Factory()
// ignore: undefined_identifier
UiFactory<ToggleOnProps> ToggleOn = _$ToggleOn;

// FIXME: `ToggleOnProps` could not be auto-migrated to the new over_react boilerplate because it extends from `AbstractToggleProps`, which was not able to be migrated.
// Address comments on that component and then see instructions here: https://github.com/Workiva/over_react_codemod/tree/master/docs/boilerplate_upgrade.md#unmigrated-superclass
@Props()
class _$ToggleOnProps extends AbstractToggleProps {}

@Component2()
class ToggleOnComponent extends UiComponent2<ToggleOnProps> {
  @override
  render() {
    return null;
  }
}
