import 'package:material_ui/material_ui.dart';
import 'package:validatorless/validatorless.dart';
import 'package:wc_2026_mobile/ui/core/share/labeled_field.dart';
import 'package:wc_2026_mobile/ui/core/share/required_text.dart';
import 'package:wc_2026_mobile/ui/core/theme/theme.dart';

class const RegisterForm({
  super.key,
  required final VoidCallback onSubmit,
  required final Widget teamPicker,
  required final bool acceptedTerms,
  required final ValueChanged<bool> onAcceptedTermChanged,
  final TextEditingController? nameController,
  final TextEditingController? emailController,
  final TextEditingController? passwordController,
}) extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: .all(30),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: AppDimens.borderRadiusXl,
        boxShadow: AppShadows.lg
      ),
      child: Column(
        crossAxisAlignment: .stretch,
        mainAxisSize: .min,
        children: [
          LinearProgressIndicator(
            value: 0.5,
            minHeight: 4,
            backgroundColor: AppColors.border,
            borderRadius: .all(Radius.circular(2)),
          ),
          const SizedBox(
             height: 16,
          ),
          Row(
            children: [
              Text('DADOS PESSOAIS', style: AppTextStyle.overline,),
              Spacer(),
              Text('* Obrigatório', style: AppTextStyle.caption.copyWith(color: AppColors.red),)
            ],
          ),
          const SizedBox(
             height: 16,
          ),
          LabeledField(
            label: 'NOME COMPLETO',
            hint: 'Daniel Dantas',
            controller: nameController,
            textCapitalization: .words,
            textInputAction: .next,
            validator: Validatorless.required('Nome obrigatório'),
          ),
          const SizedBox(
             height: 16,
          ),
          LabeledField(
            label: 'E-MAIL',
            hint: 'voce@examplo.com',
            controller: emailController,
            textInputAction: .next,
            keyboardType: .emailAddress,
            validator: Validatorless.multiple([
              Validatorless.required('E-mail obrigatório'),
              Validatorless.email('E-mail inválido')
            ]),
          ),
          const SizedBox(
             height: 16,
          ),
          LabeledField.password(
            label: 'SENHA',
            hint: '******',
            controller: passwordController,
            textInputAction: .done,
            required: true,
            validator: Validatorless.multiple([
              Validatorless.required('Senha obrigatória'),
              Validatorless.min(8, 'Mínimo de 8 caracteres')
            ]),
          ),
          const SizedBox(
             height: 18,
          ),
          const Divider(
            color: AppColors.border,
            height: 1,
            thickness: 1,
          ),
          const SizedBox(
             height: 20,
          ),
          teamPicker,
          const SizedBox(
             height: 18,
          ),
          _TermsCheckBox(
            value: acceptedTerms,
            onChanged: onAcceptedTermChanged,
          ),
          const SizedBox(
             height: 12,
          ),
          FilledButton(
            onPressed: onSubmit,
            child: Text('CONTINUAR  →'),
          )
        ],
      ),
    );
  }
}

class const _TermsCheckBox({required final bool value, required final ValueChanged<bool> onChanged}) extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!value),
      behavior: .opaque,
      child: Row(
        spacing: 5,
        crossAxisAlignment: .start,
        children: [
          Checkbox(
            value: value,
            onChanged: (checked) => onChanged(checked ?? false),
          ),
          Flexible(
            child: RequiredText(
              text: 'Aceito os termos de uso e política de privacidade.', 
              style: AppTextStyle.paragraph,
            ),
          )
        ],
      ),
    );
  }
}