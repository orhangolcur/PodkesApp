import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyMessage extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final VoidCallback? onRetry;

  const EmptyMessage({
    super.key,
    this.title = 'No data found',
    this.subtitle = '',
    this.icon = Icons.info_outline,
    this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 64.sp,
              color: theme.colorScheme.onBackground.withOpacity(0.4),
            ),
            SizedBox(height: 16.h),
            Text(
              title,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium?.copyWith(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onBackground.withOpacity(0.8),
              ),
            ),
            if (subtitle.isNotEmpty)
              Padding(
                padding: EdgeInsets.only(top: 8.h),
                child: Text(
                  subtitle,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 14.sp,
                    color: theme.colorScheme.onBackground.withOpacity(0.6),
                  ),
                ),
              ),
            if (onRetry != null) ...[
              SizedBox(height: 24.h),
              TextButton.icon(
                onPressed: onRetry,
                icon: Icon(Icons.refresh, color: Colors.white70, size: 20.sp),
                label: Text(
                  'Try Again',
                  style: TextStyle(color: Colors.white70, fontSize: 14.sp),
                ),
                style: TextButton.styleFrom(
                  foregroundColor: theme.colorScheme.primary,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
