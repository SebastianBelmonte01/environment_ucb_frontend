part of 'environment_cubit.dart';

class EnvironmentState extends Equatable {
  final PageStatus status;
  final List<EnvironmentDto> environments;
  final int selectedEnvironmentIndex;

  const EnvironmentState({
    this.status = PageStatus.initial,
    this.environments = const [EnvironmentDto(type: "No hay ambientes")],
    this.selectedEnvironmentIndex = 0,
  });

  EnvironmentState copyWith({
    PageStatus? status,
    List<EnvironmentDto>? environments,
    int? selectedEnvironmentIndex,
  }) {
    return EnvironmentState(
      status: status ?? this.status,
      environments: environments ?? this.environments,
      selectedEnvironmentIndex:
          selectedEnvironmentIndex ?? this.selectedEnvironmentIndex,
    );
  }

  @override
  List<Object> get props => [status, environments, selectedEnvironmentIndex];

}

