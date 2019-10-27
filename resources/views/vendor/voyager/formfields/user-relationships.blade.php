@if($options->type == 'belongsTo')
        
    @if(isset($view) && ($view == 'browse' || $view == 'read'))

        @php
            $relationshipData = (isset($data)) ? $data : $dataTypeContent;
            $model = app($options->model);
            $query = $model::where($options->key,$relationshipData->{$options->column})->first();
        @endphp

        @if(isset($query))
            <p>{{ $query->{$options->label} }}</p>
        @else
            <p>{{ __('voyager::generic.no_results') }}</p>
        @endif

    @else
        <select
            class="form-control select2-ajax" name="{{ $options->column }}"
            data-get-items-route="{{route('voyager.' . $dataType->slug.'.relation')}}"
            data-get-items-field="{{$row->field}}"
            data-method="{{ isset($dataTypeContent) ? 'edit' : 'add' }}"
        >
            @php
                $model = app($options->model);
                //       TCG\Models\*  column (id)    , column value (2)
                $query = $model::where($options->key, $dataTypeContent->{$options->column})->get();
            @endphp

            @if(!$row->required)
                <option value="1">Select {{$row->display_name}}</option>
            @endif

            @foreach($query as $relationshipData)
                <option value="{{ $relationshipData->{$options->key} }}" @if($dataTypeContent->{$options->column} == $relationshipData->{$options->key}){{ 'selected="selected"' }}@endif>{{ $relationshipData->{$options->label} }}</option>
            @endforeach
        </select>

    @endif
@endif