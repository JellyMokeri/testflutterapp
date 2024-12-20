import 'package:testappgulyaev/data/dtos/characters_dto.dart';
import 'package:testappgulyaev/domain/models/card.dart';

const _imagePlaceholder =
    'https://upload.wikimedia.org/wikipedia/en/archive/b/b1/20210811082420%21Portrait_placeholder.png';

extension CharacterDataDtoToModel on CharacterDataDto {
  CardData toDomain() => CardData(
    attributes?.name ?? 'UNKNOWN',
    imageUrl: attributes?.image ?? _imagePlaceholder,
    descriptionText: _makeDescriptionText(attributes?.born, attributes?.died),
  );

  String _makeDescriptionText(String? born, String? died) {
    return born != null && died != null
        ? '$born - $died'
        : born != null
        ? 'born: $born'
        : died != null
        ? 'died: $died'
        : '';
  }
}