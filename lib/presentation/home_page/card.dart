part of 'home_page.dart';

class CardData {
  final String text;
  final String descriptionText;
  final IconData icon;
  final String? imageUrl;

  CardData (
      this.text,{
        this.icon = Icons.ac_unit_outlined,
        required this.descriptionText,
        this.imageUrl,
      });
}

typedef OnLikeCallback = void Function(String title, bool isLiked)?;

class _Card extends StatefulWidget {
  final String text;
  final String descriptionText;
  final IconData icon;
  final String? imageUrl;
  final OnLikeCallback onLike;
  final VoidCallback? onTap;

  const _Card(
      this.text, {
        this.icon = Icons.ac_unit_outlined,
        required this.descriptionText,
        this.imageUrl,
        this.onLike,
        this.onTap,
      });

  factory _Card.fromData(
      CardData data, {
        OnLikeCallback onLike,
        VoidCallback? onTap,
  }) => _Card(
    data.text,
    descriptionText: data.descriptionText,
    icon: data.icon,
    imageUrl: data.imageUrl,
    onLike: onLike,
    onTap: onTap,
  );

  @override
  State<_Card> createState() => _CardState();
}

class _CardState extends State<_Card> {
  bool isLiked = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        //padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints(minHeight: 140),
        decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey,width: 2,),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(.5),
              spreadRadius: 4,
              offset: const Offset(0, 5),
              blurRadius: 8,
            ),
          ],
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
                child: SizedBox(
                  height: double.infinity,
                  width: 120,
                  child: Image.network(
                    widget.imageUrl ?? '',
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const Placeholder(),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.text,
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      Text(
                        widget.descriptionText,
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 16,
                    bottom: 16,
                  ),
                  child: GestureDetector(
                      onTap: () {
                        setState(() => isLiked = !isLiked);
                        widget.onLike?.call(widget.text, isLiked);
                      },
                      child: AnimatedSwitcher(
                        duration: const Duration(milliseconds: 300),
                        child: isLiked
                            ? const Icon(
                          Icons.favorite,
                          color: Colors.redAccent,
                          key: ValueKey<int>(0),
                        )
                            : const Icon(
                          Icons.favorite_border,
                          key: ValueKey<int>(1),
                        ),
                      )
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}